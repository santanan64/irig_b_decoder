--  ITAR specific note for NASA contracts:
--  This item (identification number) falls under the purview of the U.S. Munitions List (USML), as defined in 
--  the International Traffic in Arms Regulations (ITAR), 22 CFR 120-130, and is export controlled. It shall not 
--  be transferred to foreign nationals, in the U.S. or abroad, without specific approval from the 
--  Department of States Directorate of Defense Trade Controls and/or unless an export, license/license 
--  exemption is obtained/available from the United States Department of State. Violations of these 
--  regulations are punishable by fine, imprisonment, or both.
--
--  SBIR DATA RIGHTS
--  Contract No. NNX14CP10C
--  Contractor Name Trident Systems Inc.
--  Contractor Address 10201 Fairfax Blvd, Suite 300 Fairfax, VA 22030
--  Expiration of SBIR Data Rights Period 03 SEP 2020
--  SBIR RIGHTS NOTICE (DEC 2007)
--  These SBIR data are furnished with SBIR rights under Contract No. NNX14CP10C.  For a 
--  period of 4 years, unless extended in accordance with FAR 27.409(h), after acceptance of all 
--  items to be delivered under this contract, the Government will use these data for Government 
--  purposes only, and they shall not be disclosed outside the Government (including disclosure for 
--  procurement purposes) during such period without permission of the Contractor, except that, 
--  subject to the foregoing use and disclosure prohibitions, these data may be disclosed for use by 
--  support Contractors. After the protection period, the Government has a paid-up license to use, 
--  and to authorize others to use on its behalf, these data for Government purposes, but is relieved 
--  of all disclosure prohibitions and assumes no liability for unauthorized use of these data by third 
--  parties. This notice shall be affixed to any reproductions of these data, in whole or in part.
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tick_gen is
  generic(
    CLOCK_SPEED_MHZ                       : integer := 100
    );
  port(
    clk_in                                : in  std_logic;
    nsec_cnt_out                          : out std_logic_vector(31 downto 0);
    usec_cnt_out                          : out std_logic_vector(31 downto 0);
    msec_cnt_out                          : out std_logic_vector(31 downto 0);
    reset_in                              : in  std_logic    
    );
end entity tick_gen;

architecture imp of tick_gen is

  signal nsec_cnt_r                       : integer range 1 to CLOCK_SPEED_MHZ := 1;
  signal usec_cnt_r                       : integer range 0 to 999 := 0;
  signal msec_cnt_r                       : integer range 0 to 499 := 0;
  signal tick_1us_r                       : std_logic := '0';
  signal tick_1ms_r                       : std_logic := '0';
  
begin
  
  nsec_cnt_out      <= conv_std_logic_vector(nsec_cnt_r, 32);
  usec_cnt_out      <= conv_std_logic_vector(usec_cnt_r, 32);
  msec_cnt_out      <= conv_std_logic_vector(msec_cnt_r, 32);

  process(clk_in, reset_in)
  begin
    if(reset_in = '1') then
      nsec_cnt_r        <= 1;
      usec_cnt_r        <= 0;
      msec_cnt_r        <= 0;
      tick_1us_r        <= '0';
      tick_1ms_r        <= '0';
    elsif rising_edge(clk_in) then
      tick_1ms_r        <= '0';

      if(nsec_cnt_r = CLOCK_SPEED_MHZ) then
        nsec_cnt_r      <= 1;
        tick_1us_r      <= '1';
      else
        nsec_cnt_r      <= nsec_cnt_r + 1;
        tick_1us_r      <= '0';
      end if;

      if(tick_1us_r = '1') then
        if(usec_cnt_r = 999) then  -- 1000us 
          usec_cnt_r    <= 0;
          tick_1ms_r    <= '1';
        else
          usec_cnt_r    <= usec_cnt_r + 1;
        end if;
      end if;

      if(tick_1ms_r = '1') then
        if(msec_cnt_r = 999) then  -- 1000ms 
          msec_cnt_r    <= 0;
        else
          msec_cnt_r    <= msec_cnt_r + 1;
        end if;
      end if;


    end if;
  end process;

end architecture imp;