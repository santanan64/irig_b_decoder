library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity irig_top is
  generic (
    FPGA_REVISION_DATE            : in  std_logic_vector(31 downto 0) := x"0718_2023"
    );
  port(
    progclk_b5_p                  : in  std_logic;
    progclk_b5_n                  : in  std_logic;
    ext_pps                       : in  std_logic
--  PPS_OUT_FPGA                  : out std_logic
    );
end entity irig_top;

architecture imp of irig_top is

  signal fpga_revision_date_r     : std_logic_vector(31 downto 0) := (others => '0');
  attribute keep                  : string;
  attribute keep of fpga_revision_date_r  : signal is "true";
  
  signal clk100                   : std_logic;
  signal sys_clk250               : std_logic;
  signal mmcm_locked              : std_logic;
  signal mmcm_reset_r             : std_logic_vector(0 to 31) :=(others => '1');
  signal sys_reset                : std_logic;

  signal ts_second                : std_logic_vector( 5 downto 0);
  signal ts_minute                : std_logic_vector( 5 downto 0);
  signal ts_hour                  : std_logic_vector( 4 downto 0);
  signal ts_day                   : std_logic_vector( 8 downto 0);
  signal ts_year                  : std_logic_vector( 6 downto 0);
  signal ts_sec_day               : std_logic_vector(16 downto 0);
  signal state                    : std_logic_vector( 3 downto 0);
  signal ts_nsec                  : std_logic_vector(31 downto 0);
  signal ts_usec                  : std_logic_vector(31 downto 0);
  signal ts_msec                  : std_logic_vector(31 downto 0);

  signal one_pps                  : std_logic;
  
begin

  i_ibufds : entity work.IBUFDS
    port map (
    I                           => progclk_b5_p, 
    IB                          => progclk_b5_n, 
    O                           => clk100
    );

  process(clk100)
  begin
    if (rising_edge(clk100)) then
      mmcm_reset_r          <= mmcm_reset_r(1 to 31) & '0';
    end if;
  end process;
  
  i_clk_wiz_0 : entity work.clk_wiz_0
     port map ( 
       clk_in1                  => clk100,
       clk_out1                 => sys_clk250,
       reset                    => mmcm_reset_r(0),
       locked                   => mmcm_locked
     );

  sys_reset   <= '0' when mmcm_locked = '1' else '1';

  process(sys_clk250)
  begin
    if (rising_edge(sys_clk250)) then
      fpga_revision_date_r    <= FPGA_REVISION_DATE;
    end if;
  end process;
  
  i_irig_intfc : entity work.irig_intfc  
    port map (
      clk_in                    => sys_clk250,
      rst_in                    => sys_reset,
      irigb_in                  => ext_pps,
      pps_out                   => one_pps,
      ts_second_out             => ts_second,
      ts_minute_out             => ts_minute,
      ts_hour_out               => ts_hour,
      ts_day_out                => ts_day,
      ts_year_out               => ts_year,
      ts_sec_day_out            => ts_sec_day,
      ts_nsec_out               => ts_nsec,
      ts_usec_out               => ts_usec,
      ts_msec_out               => ts_msec
      );

  i_ila_0 : entity work.ila_0
    port map (
      clk                       => sys_clk250,
      probe0                    => fpga_revision_date_r,  --32
      probe1(0)                 => mmcm_locked,           --1     
      probe2                    => ts_second,             --6     
      probe3                    => ts_minute,             --6     
      probe4                    => ts_hour,               --5       
      probe5                    => ts_day,                --9        
      probe6                    => ts_year,               --7       
      probe7                    => ts_sec_day,            --17   
      probe8                    => state,                 --4         
      probe9                    => ts_nsec,               --32      
      probe10                    => ts_usec,              --32      
      probe11                   => ts_msec,               --32       
      probe12(0)                => one_pps                --1     
      );

-- PPS_OUT_FPGA   <= one_pps;
 
end architecture imp;