library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity chip_enable_gen is
  generic(
    CLOCK_SPEED_MHZ                       : integer := 25
    );
  port(
    clk_in                                : in  std_logic;

    tick_en_out                           : out std_logic;

    reset_in                              : in  std_logic    
    );
end entity chip_enable_gen;

architecture imp of chip_enable_gen is

  signal sysclk_cnt_r                     : integer range 0 to CLOCK_SPEED_MHZ-1;
  signal tick_en_r                        : std_logic;
  
begin

  tick_en_out      <= tick_en_r;

  process(clk_in, reset_in)
  begin
    if(reset_in = '1') then
      sysclk_cnt_r      <= 0;
      tick_en_r         <= '1';
    elsif rising_edge(clk_in) then
      if(sysclk_cnt_r = CLOCK_SPEED_MHZ-1) then
        sysclk_cnt_r    <= 0;
        tick_en_r       <= '1';
      else
        sysclk_cnt_r    <= sysclk_cnt_r + 1;
        tick_en_r       <= '0';
      end if;
    end if;
  end process;

end architecture imp;