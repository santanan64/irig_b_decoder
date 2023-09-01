library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity irig_state_vhd is
  port(
    clk_in                              : in  std_logic;
    chip_en_in                          : in  std_logic;
    rst_in                              : in  std_logic;    

    irig_d0_in                          : in  std_logic;
    irig_d1_in                          : in  std_logic;
    irig_mark_in                        : in  std_logic;

    pps_gate_out                        : out std_logic;
    ts_select_out                       : out std_logic_vector(2 downto 0);
    ts_finish_out                       : out std_logic;
    bit_idx_out                         : out std_logic_vector(4 downto 0);
    digit_idx_out                       : out std_logic_vector(1 downto 0);
    bit_value_out                       : out std_logic;
    state_out                           : out std_logic_vector(3 downto 0)
    );
end entity irig_state_vhd;

architecture imp of irig_state_vhd is

  type state_type                       is (ST_UNLOCKED, ST_PRELOCK, ST_START, ST_SECOND, ST_MINUTE, ST_HOUR, ST_DAY, ST_DAY2, 
                                            ST_YEAR, ST_UNUSED1, ST_UNUSED2, ST_SEC_DAY, ST_SEC_DAY2);

  signal state_r                        : state_type := ST_UNLOCKED;
  signal next_state                     : state_type := ST_UNLOCKED;

  signal pps_gate_r                     : std_logic := '0';
  
  --Timestamp selection
  constant TS_SELECT_SECOND             : std_logic_vector(2 downto 0) := "001";
  constant TS_SELECT_MINUTE             : std_logic_vector(2 downto 0) := "010";
  constant TS_SELECT_HOUR               : std_logic_vector(2 downto 0) := "011";
  constant TS_SELECT_DAY                : std_logic_vector(2 downto 0) := "100";
  constant TS_SELECT_YEAR               : std_logic_vector(2 downto 0) := "101";
  constant TS_SELECT_SEC_DAY            : std_logic_vector(2 downto 0) := "110";
  
  --Count of the IRIG bits within a state
  signal irig_cnt_r                     : std_logic_vector(4 downto 0) := (others => '0');
--  PPS generation internal signal
--  Output is registered version
  signal pps_en                         : std_logic := '0';

  signal state_test                     : std_logic_vector(3 downto 0);
  
begin

  pps_gate_out  <= pps_gate_r;
  state_out     <= state_test;

  process(state_r)
  begin  
    case state_r is      
      when ST_UNLOCKED  => state_test  <= "0000";
      when ST_PRELOCK   => state_test  <= "0001";
      when ST_START     => state_test  <= "0010";
      when ST_SECOND    => state_test  <= "0011";
      when ST_MINUTE    => state_test  <= "0100";
      when ST_HOUR      => state_test  <= "0101";
      when ST_DAY       => state_test  <= "0110";
      when ST_DAY2      => state_test  <= "0111";
      when ST_YEAR      => state_test  <= "1000";
      when ST_UNUSED1   => state_test  <= "1001";
      when ST_UNUSED2   => state_test  <= "1010";
      when ST_SEC_DAY   => state_test  <= "1011";
      when ST_SEC_DAY2  => state_test  <= "1100";
      when others       => state_test  <= "1111";       
    end case;  
  end process;

  -- Registers
  process(clk_in, rst_in) 
  begin
    if (rst_in = '1') then
      state_r               <= ST_UNLOCKED;
      pps_gate_r            <= '0';
      irig_cnt_r            <= (others=> '0');
    elsif (rising_edge(clk_in))  then
      if (chip_en_in = '1') then
        state_r               <= next_state;
        pps_gate_r            <= pps_en;

        -- Count the IRIG bits received between every MARK
        if (irig_mark_in = '1') then
          irig_cnt_r           <= (others=> '0');
        else 
          irig_cnt_r           <= irig_cnt_r + (irig_d0_in or irig_d1_in);
        end if;
      end if;
    end if;
  end process;
      
  process(state_r, irig_mark_in, irig_d0_in, irig_d1_in, irig_mark_in, irig_cnt_r)
  begin
    -- IRIG decoding state_r machine
    -- FIX ME add checks that cause loss of lock
    next_state                    <= state_r;
    pps_en                        <= '0';
    ts_finish_out                 <= '0';
    ts_select_out                 <= "000";
    bit_idx_out                   <= "00000";
    digit_idx_out                 <= "00";
    bit_value_out                 <= '0';
    case state_r is
      when ST_UNLOCKED =>
        if (irig_mark_in = '1') then
          next_state              <= ST_PRELOCK;
        else
          next_state              <= ST_UNLOCKED;
        end if;

      when ST_PRELOCK =>
        if (irig_mark_in = '1') then
          next_state              <= ST_SECOND;
        elsif (irig_d0_in = '1' or irig_d1_in = '1')  then
          next_state              <= ST_UNLOCKED;          
        end if;

      when ST_START =>              
        pps_en <= '1';
        -- The "else if" catches a misaligned frame after lock.
        -- If correctly aligned this state_r should only ever see a Mark on the next clock cycle.
        if (irig_mark_in = '1') then
          next_state              <= ST_SECOND;
        elsif (irig_d0_in = '1' or irig_d1_in = '1') then
          next_state              <= ST_UNLOCKED;
        end if;

      when ST_SECOND =>
        ts_select_out <= TS_SELECT_SECOND;
        if (irig_cnt_r > 4) then
          bit_idx_out             <=  irig_cnt_r - 5;
        else
          bit_idx_out             <=  irig_cnt_r;
        end if;

        if (irig_cnt_r > 4)  then
          digit_idx_out           <=  "01";
        else
          digit_idx_out           <= "00";
        end if;

        if (irig_d1_in = '1' and (irig_cnt_r /= 4)) then
          bit_value_out           <= '1';
        else
          bit_value_out           <= '0';
        end if;

        if (irig_mark_in = '1')   then
          next_state              <= ST_MINUTE;
        end if;

      when ST_MINUTE =>
        ts_select_out <= TS_SELECT_MINUTE;
        if (irig_cnt_r > 4) then
          bit_idx_out             <=  irig_cnt_r - 5;
        else
          bit_idx_out             <=  irig_cnt_r;
        end if;

        if (irig_cnt_r > 4)  then
          digit_idx_out           <=  "01";
        else
          digit_idx_out           <= "00";
        end if;

        if (irig_d1_in = '1' and (irig_cnt_r /= 4) and (irig_cnt_r /= 8)) then
          bit_value_out           <= '1';
        else
          bit_value_out           <= '0';
        end if;

        if (irig_mark_in = '1')  then
          next_state              <= ST_HOUR;
        end if;       

      when ST_HOUR =>
        ts_select_out             <= TS_SELECT_HOUR;
        if (irig_cnt_r > 4) then
          bit_idx_out             <=  irig_cnt_r - 5;
        else
          bit_idx_out             <=  irig_cnt_r;
        end if;

        if (irig_cnt_r > 4)  then
          digit_idx_out           <=  "01";
        else
          digit_idx_out           <= "00";
        end if;

        if (irig_d1_in = '1' and (irig_cnt_r /= 4) and not(irig_cnt_r >= 8)) then
          bit_value_out           <= '1';
        else
          bit_value_out           <= '0';
        end if;

        if (irig_mark_in = '1') then
          next_state              <= ST_DAY;
        end if;

      when ST_DAY =>
        ts_select_out             <= TS_SELECT_DAY;
        if (irig_cnt_r > 4) then
          bit_idx_out             <=  irig_cnt_r - 5;
        else
          bit_idx_out             <=  irig_cnt_r;
        end if;

        if (irig_cnt_r > 4)  then
          digit_idx_out           <=  "01";
        else
          digit_idx_out           <= "00";
        end if;

        if (irig_d1_in = '1' and (irig_cnt_r /= 4)) then
          bit_value_out           <= '1';
        else
          bit_value_out           <= '0';
        end if;

        if (irig_mark_in = '1') then
          next_state              <= ST_DAY2;
        end if;

      when ST_DAY2 =>
        ts_select_out             <= TS_SELECT_DAY;
        bit_idx_out               <= irig_cnt_r;
        digit_idx_out             <= "10";

        if (irig_d1_in = '1' and not(irig_cnt_r > 4)) then
          bit_value_out           <= '1';
        else
          bit_value_out           <= '0';
        end if;

        if (irig_mark_in = '1') then
          next_state              <= ST_YEAR;
        end if;

      when ST_YEAR =>
        ts_select_out             <= TS_SELECT_YEAR;
        if (irig_cnt_r > 4) then
        bit_idx_out               <=  irig_cnt_r - 5;
        else
         bit_idx_out              <=  irig_cnt_r;
        end if;

        if (irig_cnt_r > 4)  then
        digit_idx_out             <=  "01";
        else
         digit_idx_out            <= "00";
        end if;

        if (irig_d1_in = '1' and (irig_cnt_r /= 4)) then
          bit_value_out           <= '1';
        else
          bit_value_out           <= '0';
        end if;

        if (irig_mark_in = '1')  then
          next_state              <= ST_UNUSED1;
        end if;

      when ST_UNUSED1 =>
        if (irig_mark_in = '1') then
          next_state              <= ST_UNUSED2;
        end if;

      when ST_UNUSED2 =>
        if (irig_mark_in = '1') then
          next_state              <= ST_SEC_DAY;
        end if;

      when ST_SEC_DAY =>
        ts_select_out             <= TS_SELECT_SEC_DAY;
        bit_idx_out               <= irig_cnt_r;
        bit_value_out             <= irig_d1_in;
        if (irig_mark_in = '1') then
          next_state              <= ST_SEC_DAY2;
        end if;

      when ST_SEC_DAY2 =>
        ts_select_out             <= TS_SELECT_SEC_DAY;
        bit_idx_out               <= irig_cnt_r + 9;
        bit_value_out             <= irig_d1_in;
        if (irig_mark_in = '1') then
          next_state              <= ST_START;
          pps_en                  <= '1';
          ts_finish_out           <= '1';
        end if;

    end case;
  end process;

end architecture imp;
