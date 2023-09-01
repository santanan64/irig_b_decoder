library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity bcd_decoder_vhd is
  port(
    bcd_bit_idx                         : in  std_logic_vector(2 downto 0);
    bcd_digit_idx                       : in  std_logic_vector(1 downto 0);
    bcd_bit                             : in  std_logic;
    value                               : out std_logic_vector(8 downto 0) 
    );
end entity bcd_decoder_vhd;

architecture imp of bcd_decoder_vhd is

  signal bcd_multiplier                 : integer range 0 to 127; 
  signal value_int                      : unsigned(8 downto 0) := (others => '0');
  signal value_int1                     : std_logic_vector(17 downto 0)  := (others => '0');

begin

  bcd_multiplier <= 1   when bcd_digit_idx = "00" else
                    10  when bcd_digit_idx = "01" else
                    100 when bcd_digit_idx = "10" else 0;
  
  process(bcd_bit, bcd_bit_idx)
  begin
    if (bcd_bit = '1') then
      case bcd_bit_idx is
        when "000"  => value_int  <= "000000001";
        when "001"  => value_int  <= "000000010";
        when "010"  => value_int  <= "000000100";
        when "011"  => value_int  <= "000001000";
        when "100"  => value_int  <= "000010000";
        when "101"  => value_int  <= "000100000";
        when "110"  => value_int  <= "001000000";
        when "111"  => value_int  <= "010000000";
        when others => value_int  <= (others => '0');
      end case;
    else
      value_int     <= (others => '0');
    end if;
  end process;
  
  value_int1      <= std_logic_vector(value_int * bcd_multiplier);  
  value           <= value_int1(8 downto 0);

end architecture imp;