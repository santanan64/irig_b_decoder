library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity irig_timestamp_vhd is
  port(
    clk_in                              : in  std_logic;
    chip_en_in                          : in  std_logic;
    rst_in                              : in  std_logic;

    bit_idx_in                          : in  std_logic_vector( 4 downto 0);
    digit_idx_in                        : in  std_logic_vector( 1 downto 0);
    bit_value_in                        : in  std_logic;
    ts_select_in                        : in  std_logic_vector( 2 downto 0);
    ts_finish_in                        : in  std_logic;

    ts_second_out                       : out std_logic_vector( 5 downto 0);
    ts_minute_out                       : out std_logic_vector( 5 downto 0);
    ts_hour_out                         : out std_logic_vector( 4 downto 0);
    ts_day_out                          : out std_logic_vector( 8 downto 0);
    ts_year_out                         : out std_logic_vector( 6 downto 0);
    ts_sec_day_out                      : out std_logic_vector(16 downto 0)
    );
end entity irig_timestamp_vhd;

architecture imp of irig_timestamp_vhd is

  --Timestamp selection
  constant TS_SELECT_SECOND             : std_logic_vector( 2 downto 0) := "001";
  constant TS_SELECT_MINUTE             : std_logic_vector( 2 downto 0) := "010";
  constant TS_SELECT_HOUR               : std_logic_vector( 2 downto 0) := "011";
  constant TS_SELECT_DAY                : std_logic_vector( 2 downto 0) := "100";
  constant TS_SELECT_YEAR               : std_logic_vector( 2 downto 0) := "101";
  constant TS_SELECT_SEC_DAY            : std_logic_vector( 2 downto 0) := "110";
  
    -- Internal registers for accumulation
  signal ts_second_r1                   : std_logic_vector( 5 downto 0) := (others => '0');
  signal ts_minute_r1                   : std_logic_vector( 5 downto 0) := (others => '0');
  signal ts_hour_r1                     : std_logic_vector( 4 downto 0) := (others => '0');
  signal ts_day_r1                      : std_logic_vector( 8 downto 0) := (others => '0');
  signal ts_year_r1                     : std_logic_vector( 6 downto 0) := (others => '0');
  signal ts_sec_day_r1                  : std_logic_vector(16 downto 0) := (others => '0');

  signal ts_second_r                    : std_logic_vector( 5 downto 0) := (others => '0');
  signal ts_minute_r                    : std_logic_vector( 5 downto 0) := (others => '0');
  signal ts_hour_r                      : std_logic_vector( 4 downto 0) := (others => '0');
  signal ts_day_r                       : std_logic_vector( 8 downto 0) := (others => '0');
  signal ts_year_r                      : std_logic_vector( 6 downto 0) := (others => '0');
  signal ts_sec_day_r                   : std_logic_vector(18 downto 0) := (others => '0');

  -- Reset the internal accumulators once finished
  -- and outputs are registered
  signal ts_reset                       : std_logic;

  -- Decode the BCD bit into a value
  signal value                          : std_logic_vector(8 downto 0);
  signal index                          : integer range 0 to 16; 

    
begin  

  ts_second_out     <= ts_second_r1;            
  ts_minute_out     <= ts_minute_r1;            
  ts_hour_out       <= ts_hour_r1;              
  ts_day_out        <= ts_day_r1;               
  ts_year_out       <= ts_year_r1;              
  ts_sec_day_out    <= ts_sec_day_r1;           

  bd1 : entity work.bcd_decoder_vhd 
    port map (
      bcd_bit_idx                       => bit_idx_in(2 downto 0),
      bcd_digit_idx                     => digit_idx_in,
      bcd_bit                           => bit_value_in,
      value                             => value
      );

  index   <= conv_integer(unsigned(bit_idx_in));
    
  process(clk_in, rst_in) 
  begin
    if (rst_in = '1') then
      ts_second_r1                       <= (others => '0');
      ts_minute_r1                       <= (others => '0');
      ts_hour_r1                         <= (others => '0');
      ts_day_r1                          <= (others => '0');
      ts_year_r1                         <= (others => '0');
      ts_sec_day_r1                      <= (others => '0');
      ts_second_r                        <= (others => '0');
      ts_minute_r                        <= (others => '0');
      ts_hour_r                          <= (others => '0');
      ts_day_r                           <= (others => '0');
      ts_year_r                          <= (others => '0');
      ts_sec_day_r                       <= (others => '0');
      ts_reset                           <= '0';
    elsif (rising_edge(clk_in)) then
      if (ts_reset = '1') then
        ts_second_r                     <= (others => '0');
        ts_minute_r                     <= (others => '0');
        ts_hour_r                       <= (others => '0');
        ts_day_r                        <= (others => '0');
        ts_year_r                       <= (others => '0');
        ts_sec_day_r                    <= (others => '0');
        ts_reset                        <= '0';
      elsif (chip_en_in = '1') then      
        if (ts_finish_in = '1') then
          -- Finished decoding -- transfer to output registers
          -- and hold there until next second
          ts_second_r1                  <= ts_second_r;
          ts_minute_r1                  <= ts_minute_r;
          ts_hour_r1                    <= ts_hour_r;
          ts_day_r1                     <= ts_day_r;
          ts_year_r1                    <= ts_year_r;
          ts_sec_day_r1                 <= ts_sec_day_r(16 downto 0);
          ts_reset                      <= '1';
        else
          -- Mux the decoded output into the correct timestamp
          -- and accumulate the sum
          case (ts_select_in) is
            when TS_SELECT_SECOND =>
              ts_second_r               <= ts_second_r + value(5 downto 0);
            when TS_SELECT_MINUTE =>
              ts_minute_r               <= ts_minute_r + value(5 downto 0);
            when TS_SELECT_HOUR =>
              ts_hour_r                 <= ts_hour_r + value(4 downto 0);
            when TS_SELECT_DAY =>
              ts_day_r                  <= ts_day_r + value;
            when TS_SELECT_YEAR =>
              ts_year_r                 <= ts_year_r + value(6 downto 0);
            when TS_SELECT_SEC_DAY =>
              ts_sec_day_r(index)       <= ts_sec_day_r(index) or bit_value_in;  
            when others => 
          end case;
        end if;
      end if;
    end if;
  end process;
      
end architecture imp;
