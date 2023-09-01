library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity irig_width_decoder is
  port(
    clk_in                              : in  std_logic;
    chip_en_in                          : in  std_logic;
    irigb_in                            : in  std_logic;

    irig_mark_out                       : out std_logic;
    irig_d0_out                         : out std_logic;
    irig_d1_out                         : out std_logic;

    rst_in                              : in  std_logic    
    );
end entity irig_width_decoder;

architecture imp of irig_width_decoder is

  -- 10MHz clock  
  -- Width encoding of the three states
  -- Add 0.1ms tolerance for shorter pulses                                     -- 1/10 MHz = 100 nSec
  constant CYCLES_ZERO                  : integer range 0 to 262143 := 19000;    -- 1.9 mSec / 100 nSec = 19000  
  constant CYCLES_ONE                   : integer range 0 to 262143 := 49000;    -- 4.9 mSec / 100 nSec = 49000 
  constant CYCLES_MARK                  : integer range 0 to 262143 := 79000;    -- 7.9 mSec / 100 nSec = 79000 

  -- Clock cycles in an IRIG bit
  signal clk_cnt_d                      : std_logic_vector(16 downto 0) := (others => '0');
  signal irigb_last_d                   : std_logic := '0';

  signal irig_mark_d                    : std_logic := '0';
  signal irig_d1_d                      : std_logic := '0';
  signal irig_d0_d                      : std_logic := '0';

begin

  irig_mark_out   <= irig_mark_d;
  irig_d1_out     <= irig_d1_d;
  irig_d0_out     <= irig_d0_d;
      
  process(clk_in)
  begin
    if (rising_edge(clk_in)) then
      if (rst_in = '1') then
        clk_cnt_d               <= (others => '0');
        irigb_last_d            <= '0';
        irig_d0_d               <= '0';
        irig_d1_d               <= '0';
        irig_mark_d             <= '0';
      else
        if (chip_en_in = '1') then
              -- Check widths at irig falling edge and produce one-cycle pulse
          if ((clk_cnt_d >= CYCLES_MARK) and (irigb_in = '0') and (irigb_last_d = '1') and (irig_mark_d = '0')) then
            irig_mark_d           <= '1';
          else
            irig_mark_d           <= '0';
          end if;

          if ((clk_cnt_d >= CYCLES_ONE) and (clk_cnt_d < CYCLES_MARK) and (irigb_in = '0') and (irigb_last_d = '1') and (irig_d1_d = '0')) then
            irig_d1_d             <= '1';
          else
            irig_d1_d             <= '0';
          end if;

          if ((clk_cnt_d >= CYCLES_ZERO) and (clk_cnt_d < CYCLES_ONE) and (irigb_in = '0') and (irigb_last_d = '1') and (irig_d0_d = '0')) then
            irig_d0_d             <= '1';
          else
            irig_d0_d             <= '0';
          end if;

          -- Reset count on rising edge of irig bit
          if (irigb_in = '1' and irigb_last_d = '0') then
            clk_cnt_d             <= (others => '0');
          elsif (irigb_in = '0') then -- Freeze the counter if no pulse or edge
            clk_cnt_d             <= clk_cnt_d;
          else
            clk_cnt_d             <= clk_cnt_d + 1;
          end if;

          irigb_last_d            <= irigb_in;
        end if;
      end if;
    end if;
  end process;

end architecture imp;

