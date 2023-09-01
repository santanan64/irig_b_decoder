#**************************************************************************
#*************             BittWare Incorporated              *************
#*************      45 S. Main Street, Concord, NH 03301      *************
#**************************************************************************
# LEGAL NOTICE:                                                             
#                 Copyright (c) 2019 BittWare, a Molex Company                       
# This source code is provided to you (the Licensee) under license by BittWare,
# a Molex Company.  To view or use this source code, the Licensee must accept
# a Software License Agreement (viewable at developer.bittware.com), which is
# commonly provided as a click-through license agreement.  The terms of the
# Software License Agreement govern all use and distribution of this file
# unless an alternative superseding license has been executed with BittWare.
# This source code and its derivatives may not be distributed to third parties
# in source code form.  Software including or derived from this source code,
# including derivative works thereof created by Licensee, may be distributed
# to third parties with BITTWARE hardware only and in executable form only.
#
# The click-thorough license is available here:
# https://developer.bittware.com/software_license.txt
#                                                                         
# E-mail: support@bittware.com                    Tel: 603-226-0404        
#**************************************************************************

##################################################
##########        Configuration         ##########
##################################################
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CONFIG_MODE SPIx4  [current_design]
set_property BITSTREAM.CONFIG.USR_ACCESS TIMESTAMP [current_design]; # Bitstream configuration settings
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design];  # Must set to "NO" if loading from backup flash partition
set_property BITSTREAM.CONFIG.CONFIGRATE 85.0 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]

##################################################
##########      Board Clocks/Reset      ##########
##################################################
set_property IOSTANDARD LVCMOS18 [get_ports sys_rst_l]; # Active Low Global Reset
set_property PACKAGE_PIN AL19 [get_ports sys_rst_l]
set_property PACKAGE_PIN AV22 [get_ports progclk_b5_p]; # SI5341B_P_5
set_property PACKAGE_PIN AV21 [get_ports progclk_b5_n]; # SI5341B_N_5
set_property IOSTANDARD DIFF_SSTL18_I [get_ports progclk_b5_p]

set_property IOSTANDARD LVCMOS18 [get_ports ext_refclk_1]; # Ext Ref Clock 
set_property PACKAGE_PIN AY21 [get_ports ext_refclk_1]
set_property IOSTANDARD LVCMOS18 [get_ports ext_pps]; # Ext PPS
set_property PACKAGE_PIN AW21 [get_ports ext_pps]

##################################################
##########      Board Outclk           ##########
##################################################
set_property IOSTANDARD LVDS [get_ports fab_outclkp_i[0]]; # Fabric Out Clk 0 / SI5346A Input 2
set_property PACKAGE_PIN AT22 [get_ports fab_outclkp_i[0]]
set_property IOSTANDARD LVDS [get_ports fab_outclkn_i[0]]]
set_property PACKAGE_PIN AU22 [get_ports fab_outclkn_i[0]]

set_property IOSTANDARD LVDS [get_ports fab_outclkp_i[1]]; # Fabric Out Clk 1 / SI5346B Input 2
set_property PACKAGE_PIN AT20 [get_ports fab_outclkp_i[1]]
set_property IOSTANDARD LVDS [get_ports fab_outclkn_i[1]]
set_property PACKAGE_PIN AT19 [get_ports fab_outclkn_i[1]]

##################################################
##########     Misc. Board-specific     ##########
##################################################
set_property IOSTANDARD LVCMOS18 [get_ports fpga_i2c_master_l]; # FPGA I2C Master. 0 = FPGA has control of I2C chains shared with the BMC.
set_property PACKAGE_PIN AM19 [get_ports fpga_i2c_master_l]

##################################################
##########       UART I/F's             ##########
##################################################
set_property IOSTANDARD LVCMOS18 [get_ports avr_rxd]; # AVR UART Rx Data
set_property PACKAGE_PIN AN22 [get_ports avr_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports avr_txd]; # AVR UART Tx Data
set_property PACKAGE_PIN AN21 [get_ports avr_txd]
set_property IOSTANDARD LVCMOS18 [get_ports usb_uart_rxd]; # FTDI UART Rx Data
set_property PACKAGE_PIN BD21 [get_ports usb_uart_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports usb_uart_txd]; # FTDI UART Tx Data
set_property PACKAGE_PIN BD20 [get_ports usb_uart_txd]

##################################################
##########       I2C I/F's              ##########
##################################################
set_property IOSTANDARD LVCMOS18 [get_ports i2c_sda_3]; # I2C SDA 3 Expander
set_property PACKAGE_PIN AP19 [get_ports i2c_sda]
set_property IOSTANDARD LVCMOS18 [get_ports i2c_scl_3]; # I2C SCL 3 Expander
set_property PACKAGE_PIN AN19 [get_ports i2c_scl]

##################################################
##########    Misc Signals              ##########
##################################################
set_property IOSTANDARD LVCMOS18 [get_ports qsfp13_lol_a_l]; # QSFP13 Loss of Lock A
set_property PACKAGE_PIN BB19 [get_ports qsfp13_lol_a_l]
set_property IOSTANDARD LVCMOS18 [get_ports qsfp13_lol_b_l]; # QSFP13 Loss of Lock B
set_property PACKAGE_PIN BF17 [get_ports qsfp13_lol_b_l]
set_property IOSTANDARD LVCMOS18 [get_ports qsfp24_lol_a_l]; # QSFP24 Loss of Lock A
set_property PACKAGE_PIN BE17 [get_ports qsfp24_lol_a_l]
set_property IOSTANDARD LVCMOS18 [get_ports qsfp24_lol_b_l]; # QSFP24 Loss of Lock B
set_property PACKAGE_PIN BE16 [get_ports qsfp24_lol_b_l]
set_property IOSTANDARD LVCMOS18 [get_ports qsfp_int_l]; # QSFP Interrupt
set_property PACKAGE_PIN AW19 [get_ports qsfp_int_l]
set_property IOSTANDARD LVCMOS18 [get_ports irq_to_fpga]; # Interrupt from avr to fpga
set_property PACKAGE_PIN AM21 [get_ports irq_to_fpga]
set_property IOSTANDARD LVCMOS18 [get_ports irq_to_avr]; # Interrupt to avr from fpga
set_property PACKAGE_PIN AM20 [get_ports irq_to_avr]

##################################################
##########       Oculink GPIO           ##########
##################################################
set_property IOSTANDARD LVCMOS18 [get_ports {ocu1_vio[0]}]; # Oculink 1 GPIO 0
set_property PACKAGE_PIN BC18 [get_ports {ocu1_vio[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu1_vio[1]}]; # Oculink 1 GPIO 1
set_property PACKAGE_PIN AY20 [get_ports {ocu1_vio[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu1_vio[2]}]; # Oculink 1 GPIO 2
set_property PACKAGE_PIN BA20 [get_ports {ocu1_vio[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu1_vio[3]}];  # Oculink 1 GPIO 3
set_property PACKAGE_PIN BB21 [get_ports {ocu1_vio[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu1_vio[4]}];  # Oculink 1 GPIO 4
set_property PACKAGE_PIN BC21 [get_ports {ocu1_vio[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu1_vio[5]}]; # Oculink 1 GPIO 5
set_property PACKAGE_PIN BA19 [get_ports {ocu1_vio[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu1_vio[6]}];  # Oculink 1 GPIO 6/Oculink i2c scl
set_property PACKAGE_PIN AR20 [get_ports {ocu1_vio[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu1_vio[7]}];  # Oculink 1 GPIO 7/Oculink i2c sda
set_property PACKAGE_PIN AU21 [get_ports {ocu1_vio[7]}]

set_property IOSTANDARD LVCMOS18 [get_ports {ocu2_vio[0]}]; # Oculink 2 GPIO 0
set_property PACKAGE_PIN BF20 [get_ports {ocu2_vio[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu2_vio[1]}]; # Oculink 2 GPIO 1
set_property PACKAGE_PIN BF19 [get_ports {ocu2_vio[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu2_vio[2]}]; # Oculink 2 GPIO 2
set_property PACKAGE_PIN BD19 [get_ports {ocu2_vio[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu2_vio[3]}]; # Oculink 2 GPIO 3
set_property PACKAGE_PIN BD18 [get_ports {ocu2_vio[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu2_vio[4]}]; # Oculink 2 GPIO 4
set_property PACKAGE_PIN BE21 [get_ports {ocu2_vio[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu2_vio[5]}]; # Oculink 2 GPIO 5
set_property PACKAGE_PIN BE20 [get_ports {ocu2_vio[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu2_vio[6]}];  # Oculink 2 GPIO 6/Oculink i2c scl
set_property PACKAGE_PIN AU20 [get_ports {ocu2_vio[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ocu2_vio[7]}];  # Oculink 2 GPIO 7/Oculink i2c sda
set_property PACKAGE_PIN AR22 [get_ports {ocu2_vio[7]}]


##################################################
##########             LEDs             ##########
##################################################
set_property IOSTANDARD LVCMOS18 [get_ports {led_l[0]}]; # Active Low Led 0
set_property PACKAGE_PIN AL21 [get_ports {led_l[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_l[1]}]; # Active Low Led 1
set_property PACKAGE_PIN AL20 [get_ports {led_l[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_l[2]}]; # Active Low Led 2
set_property PACKAGE_PIN AP21 [get_ports {led_l[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_l[3]}]; # Active Low Led 3
set_property PACKAGE_PIN AP20 [get_ports {led_l[3]}]

##################################################
##########             PCIe             ##########
##################################################
set_property PACKAGE_PIN BB20 [get_ports pcie_sys_reset_l]; # PCIE Active Low Reset
set_property IOSTANDARD LVCMOS18 [get_ports pcie_sys_reset_l]
set_property PULLUP true [get_ports pcie_sys_reset_l]
set_property PACKAGE_PIN AT10 [get_ports pcie_sys_clkn]; # PCIE Reference Clock 0
set_property PACKAGE_PIN AT11 [get_ports pcie_sys_clkp]
#set_property PACKAGE_PIN AH10 [get_ports pcie_sys_clkn]; # PCIE Reference Clock 1
#set_property PACKAGE_PIN AH11 [get_ports pcie_sys_clkp]
create_clock -period 10.000 -name refclk_100 [get_ports pcie_sys_clkp]; # PCIe Reference Clock Frequency (100 MHz)

# NOTE: All GTY pins are automatically assigned by Vivado. Shown here for reference only.

#GTH BANK 224 PCIE Lanes 15:12
#set_property package_pin BC1 [get_ports pcie_7x_mgt_rxn[15]];  #PCIE_RX_N_15
#set_property package_pin BC2 [get_ports pcie_7x_mgt_rxp[15]];  #PCIE_RX_P_15
#set_property package_pin BA1 [get_ports pcie_7x_mgt_rxn[14]];  #PCIE_RX_N_14
#set_property package_pin BA2 [get_ports pcie_7x_mgt_rxp[14]];  #PCIE_RX_P_14
#set_property package_pin AW3 [get_ports pcie_7x_mgt_rxn[13]];  #PCIE_RX_N_13
#set_property package_pin AW4 [get_ports pcie_7x_mgt_rxp[13]];  #PCIE_RX_P_13
#set_property package_pin AV1 [get_ports pcie_7x_mgt_rxn[12]];  #PCIE_RX_N_12
#set_property package_pin AV2 [get_ports pcie_7x_mgt_rxp[12]];  #PCIE_RX_P_12
#set_property package_pin BF4 [get_ports pcie_7x_mgt_txn[15]];  #PCIE_TX_N_15
#set_property package_pin BF5 [get_ports pcie_7x_mgt_txp[15]];  #PCIE_TX_P_15
#set_property package_pin BD4 [get_ports pcie_7x_mgt_txn[14]];  #PCIE_TX_N_14
#set_property package_pin BD5 [get_ports pcie_7x_mgt_txp[14]];  #PCIE_TX_P_14
#set_property package_pin BB4 [get_ports pcie_7x_mgt_txn[13]];  #PCIE_TX_N_13
#set_property package_pin BB5 [get_ports pcie_7x_mgt_txp[13]];  #PCIE_TX_P_13
#set_property package_pin AV6 [get_ports pcie_7x_mgt_txn[12]];  #PCIE_TX_N_12
#set_property package_pin AV7 [get_ports pcie_7x_mgt_txp[12]];  #PCIE_TX_P_12

#GTH BANK 225 PCIE Lanes 11:8
#set_property package_pin AU3 [get_ports pcie_7x_mgt_rxn[11]];  #PCIE_RX_N_11
#set_property package_pin AU4 [get_ports pcie_7x_mgt_rxp[11]];  #PCIE_RX_P_11
#set_property package_pin AT1 [get_ports pcie_7x_mgt_rxn[10]];  #PCIE_RX_N_10
#set_property package_pin AT2 [get_ports pcie_7x_mgt_rxp[10]];  #PCIE_RX_P_10
#set_property package_pin AR3 [get_ports pcie_7x_mgt_rxn[9]];  #PCIE_RX_N_9
#set_property package_pin AR4 [get_ports pcie_7x_mgt_rxp[9]];  #PCIE_RX_P_9
#set_property package_pin AP1 [get_ports pcie_7x_mgt_rxn[8]];  #PCIE_RX_N_8
#set_property package_pin AP2 [get_ports pcie_7x_mgt_rxp[8]];  #PCIE_RX_P_8
#set_property package_pin AU8 [get_ports pcie_7x_mgt_txn[11]];  #PCIE_TX_N_11
#set_property package_pin AU9 [get_ports pcie_7x_mgt_txp[11]];  #PCIE_TX_P_11
#set_property package_pin AT6 [get_ports pcie_7x_mgt_txn[10]];  #PCIE_TX_N_10
#set_property package_pin AT7 [get_ports pcie_7x_mgt_txp[10]];  #PCIE_TX_P_10
#set_property package_pin AR8 [get_ports pcie_7x_mgt_txn[9]];  #PCIE_TX_N_9
#set_property package_pin AR9 [get_ports pcie_7x_mgt_txp[9]];  #PCIE_TX_P_9
#set_property package_pin AP6 [get_ports pcie_7x_mgt_txn[8]];  #PCIE_TX_N_8
#set_property package_pin AP7 [get_ports pcie_7x_mgt_txp[8]];  #PCIE_TX_P_8

#GTH BANK 226 PCIE 7:4
#set_property package_pin AN3 [get_ports pcie_7x_mgt_rxn[7]];  #PCIE_RX_N_7
#set_property package_pin AN4 [get_ports pcie_7x_mgt_rxp[7]];  #PCIE_RX_P_7
#set_property package_pin AM1 [get_ports pcie_7x_mgt_rxn[6]];  #PCIE_RX_N_6
#set_property package_pin AM2 [get_ports pcie_7x_mgt_rxp[6]];  #PCIE_RX_P_6
#set_property package_pin AL3 [get_ports pcie_7x_mgt_rxn[5]]; #PCIE_RX_N_5
#set_property package_pin AL4 [get_ports pcie_7x_mgt_rxp[5]]; #PCIE_RX_P_5
#set_property package_pin AK1 [get_ports pcie_7x_mgt_rxn[4]]; #PCIE_RX_N_4
#set_property package_pin AK2 [get_ports pcie_7x_mgt_rxp[4]]; #PCIE_RX_P_4
#set_property package_pin AN8 [get_ports pcie_7x_mgt_txn[7]];  #PCIE_TX_N_7
#set_property package_pin AN9 [get_ports pcie_7x_mgt_txp[7]];  #PCIE_TX_P_7
#set_property package_pin AM6 [get_ports pcie_7x_mgt_txn[6]];  #PCIE_TX_N_6
#set_property package_pin AM7 [get_ports pcie_7x_mgt_txp[6]];  #PCIE_TX_P_6
#set_property package_pin AL8 [get_ports pcie_7x_mgt_txn[5]]; #PCIE_TX_N_5
#set_property package_pin AL9 [get_ports pcie_7x_mgt_txp[5]]; #PCIE_TX_P_5
#set_property package_pin AK6 [get_ports pcie_7x_mgt_txn[4]]; #PCIE_TX_N_4
#set_property package_pin AK7 [get_ports pcie_7x_mgt_txp[4]]; #PCIE_TX_P_4

#GTH BANK 227 PCIE 3:0
#set_property package_pin AJ3 [get_ports pcie_7x_mgt_rxn[3]]; #PCIE_RX_N_3
#set_property package_pin AJ4 [get_ports pcie_7x_mgt_rxp[3]]; #PCIE_RX_P_3
#set_property package_pin AH1 [get_ports pcie_7x_mgt_rxn[2]]; #PCIE_RX_N_2
#set_property package_pin AH2 [get_ports pcie_7x_mgt_rxp[2]]; #PCIE_RX_P_2
#set_property package_pin AG3 [get_ports pcie_7x_mgt_rxn[1]]; #PCIE_RX_N_1
#set_property package_pin AG4 [get_ports pcie_7x_mgt_rxp[1]]; #PCIE_RX_P_1
#set_property package_pin AF1 [get_ports pcie_7x_mgt_rxn[0]]; #PCIE_RX_N_0
#set_property package_pin AF2 [get_ports pcie_7x_mgt_rxp[0]]; #PCIE_RX_P_0
#set_property package_pin AJ8 [get_ports pcie_7x_mgt_txn[3]]; #PCIE_TX_N_3
#set_property package_pin AJ9 [get_ports pcie_7x_mgt_txp[3]]; #PCIE_TX_P_3
#set_property package_pin AH6 [get_ports pcie_7x_mgt_txn[2]]; #PCIE_TX_N_2
#set_property package_pin AH7 [get_ports pcie_7x_mgt_txp[2]]; #PCIE_TX_P_2
#set_property package_pin AG8 [get_ports pcie_7x_mgt_txn[1]]; #PCIE_TX_N_1
#set_property package_pin AG9 [get_ports pcie_7x_mgt_txp[1]]; #PCIE_TX_P_1
#set_property package_pin AF6 [get_ports pcie_7x_mgt_txn[0]]; #PCIE_TX_N_0
#set_property package_pin AF7 [get_ports pcie_7x_mgt_txp[0]]; #PCIE_TX_P_0

##################################################
##########        Memory Clocks         ##########
##################################################
set_property PACKAGE_PIN AY18  [get_ports ddr4_sys_clk_1_p]; # DIMM 1 Reference Clock
set_property PACKAGE_PIN AY17  [get_ports ddr4_sys_clk_1_n]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddr4_sys_clk_1_p]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddr4_sys_clk_1_n]
set_property ODT RTT_48 [get_ports ddr4_sys_clk_1_p]

set_property PACKAGE_PIN BB31  [get_ports ddr4_sys_clk_2_p]; # DIMM 2 Reference Clock
set_property PACKAGE_PIN BB32  [get_ports ddr4_sys_clk_2_n]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddr4_sys_clk_2_p]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddr4_sys_clk_2_n]
set_property ODT RTT_48 [get_ports ddr4_sys_clk_2_p]

set_property PACKAGE_PIN G30 [get_ports ddr4_sys_clk_3_p]; # DIMM 3 Reference Clock
set_property PACKAGE_PIN F30 [get_ports ddr4_sys_clk_3_n]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddr4_sys_clk_3_p]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddr4_sys_clk_3_n]
set_property ODT RTT_48 [get_ports ddr4_sys_clk_3_p]

set_property PACKAGE_PIN G20 [get_ports ddr4_sys_clk_4_p]; # DIMM 4 Reference Clock
set_property PACKAGE_PIN F19 [get_ports ddr4_sys_clk_4_n]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddr4_sys_clk_4_p]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports ddr4_sys_clk_4_n]
set_property ODT RTT_48 [get_ports ddr4_sys_clk_4_p]

##################################################
##########     Memory DIMM Pins         ##########
##################################################
# NOTE: May Contain extra pins depending on your exact memory configuration
### RDIMM 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_act_n"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_act_n"]
set_property PACKAGE_PIN       BC16            [get_ports "m0_ddr4_act_n"]; #Dimm 1 Activation Command Low
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[0]"]
set_property PACKAGE_PIN       AT18            [get_ports "m0_ddr4_adr[0]"]; #Dimm 1 Address 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[1]"]
set_property PACKAGE_PIN       AT17            [get_ports "m0_ddr4_adr[1]"]; #Dimm 1 Address 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[2]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[2]"]
set_property PACKAGE_PIN       AU17            [get_ports "m0_ddr4_adr[2]"]; #Dimm 1 Address 2
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[3]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[3]"]
set_property PACKAGE_PIN       AU16            [get_ports "m0_ddr4_adr[3]"]; #Dimm 1 Address 3
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[4]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[4]"]
set_property PACKAGE_PIN       AV17            [get_ports "m0_ddr4_adr[4]"]; #Dimm 1 Address 4
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[5]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[5]"]
set_property PACKAGE_PIN       AV16            [get_ports "m0_ddr4_adr[5]"]; #Dimm 1 Address 5
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[6]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[6]"]
set_property PACKAGE_PIN       AR17            [get_ports "m0_ddr4_adr[6]"]; #Dimm 1 Address 6
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[7]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[7]"]
set_property PACKAGE_PIN       AM17            [get_ports "m0_ddr4_adr[7]"]; #Dimm 1 Address 7
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[8]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[8]"]
set_property PACKAGE_PIN       AM16            [get_ports "m0_ddr4_adr[8]"]; #Dimm 1 Address 8
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[9]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[9]"]
set_property PACKAGE_PIN       AP18            [get_ports "m0_ddr4_adr[9]"]; #Dimm 1 Address 9
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[10]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[10]"]
set_property PACKAGE_PIN       AR18            [get_ports "m0_ddr4_adr[10]"]; #Dimm 1 Address 10
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[11]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[11]"]
set_property PACKAGE_PIN       AL17            [get_ports "m0_ddr4_adr[11]"]; #Dimm 1 Address 11
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[12]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[12]"]
set_property PACKAGE_PIN       AL16            [get_ports "m0_ddr4_adr[12]"]; #Dimm 1 Address 12
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[13]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[13]"]
set_property PACKAGE_PIN       AL15            [get_ports "m0_ddr4_adr[13]"]; #Dimm 1 Address 13
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[14]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[14]"]
set_property PACKAGE_PIN       AM15            [get_ports "m0_ddr4_adr[14]"]; #Dimm 1 Address 14
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[15]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[15]"]
set_property PACKAGE_PIN       AN17            [get_ports "m0_ddr4_adr[15]"]; #Dimm 1 Address 15
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_adr[16]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_adr[16]"]
set_property PACKAGE_PIN       AN16            [get_ports "m0_ddr4_adr[16]"]; #Dimm 1 Address 16
set_property PACKAGE_PIN       AN18            [get_ports "m0_ddr4_adr[17]"]; #Dimm 1 Address 17
set_property PACKAGE_PIN       AP16            [get_ports "m0_ddr4_alert_n"]; #Dimm 1 Active Low Alert
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_ba[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_ba[0]"]
set_property PACKAGE_PIN       AW16            [get_ports "m0_ddr4_ba[0]"]; #Dimm 1 Bank Address 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_ba[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_ba[1]"]
set_property PACKAGE_PIN       AY16            [get_ports "m0_ddr4_ba[1]"]; #Dimm 1 Bank Address 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_bg[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_bg[0]"]
set_property PACKAGE_PIN       BB17            [get_ports "m0_ddr4_bg[0]"]; #Dimm 1 Bank Group 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_bg[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_bg[1]"]
set_property PACKAGE_PIN       BB16            [get_ports "m0_ddr4_bg[1]"]; #Dimm 1 Bank Group 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_cke[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_cke[0]"]
set_property PACKAGE_PIN       BB15            [get_ports "m0_ddr4_cke[0]"]; #Dimm 1 Clock Enable 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_cke[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_cke[1]"]
set_property PACKAGE_PIN       BC13            [get_ports "m0_ddr4_cke[1]"]; #Dimm 1 Clock Enable 1
set_property PACKAGE_PIN       AW18            [get_ports "m0_ddr4_ck_c"]; #Dimm 1 Clock
set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports "m0_ddr4_ck_c[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_ck_c[0]"]
set_property PACKAGE_PIN       AV18            [get_ports "m0_ddr4_ck_t"]; #Dimm 1 Clock
set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports "m0_ddr4_ck_t[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_ck_t[0]"]
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_cs_n[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_cs_n[0]"]
set_property PACKAGE_PIN       BD11            [get_ports "m0_ddr4_cs_n[0]"];#Dimm 1 Active Low Chip Select 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_cs_n[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_cs_n[1]"]
set_property PACKAGE_PIN       BA15            [get_ports "m0_ddr4_cs_n[1]"]; #Dimm 1 Active Low Chip Select 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_c[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_c[0]"]
set_property PACKAGE_PIN       BC14            [get_ports "m0_ddr4_c[0]"]; #Dimm 1 Active Low Chip Select 2
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_c[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_c[1]"]
set_property PACKAGE_PIN       BC11            [get_ports "m0_ddr4_c[1]"]; #Dimm 1 Active Low Chip Select 3
set_property PACKAGE_PIN       AR16            [get_ports "m0_ddr4_c[2]"]; #Dimm 1 Die Select
set_property PACKAGE_PIN       AP25            [get_ports "m0_ddr4_c[3]"]; #Dimm 1 RFU
set_property PACKAGE_PIN       AU15            [get_ports "m0_ddr4_c[4]"]; #Dimm 1 RFU
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[0]"]
set_property PACKAGE_PIN       AM25            [get_ports "m0_ddr4_dqs_c[0]"]; #Dimm 1 Data Strobe 0
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[1]"]
set_property PACKAGE_PIN       AN24            [get_ports "m0_ddr4_dqs_c[1]"]; #Dimm 1 Data Strobe 1
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[2]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[2]"]
set_property PACKAGE_PIN       AT23            [get_ports "m0_ddr4_dqs_c[2]"]; #Dimm 1 Data Strobe 2
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[3]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[3]"]
set_property PACKAGE_PIN       AW26            [get_ports "m0_ddr4_dqs_c[3]"]; #Dimm 1 Data Strobe 3
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[4]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[4]"]
set_property PACKAGE_PIN       AY23            [get_ports "m0_ddr4_dqs_c[4]"]; #Dimm 1 Data Strobe 4
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[5]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[5]"]
set_property PACKAGE_PIN       BC22            [get_ports "m0_ddr4_dqs_c[5]"]; #Dimm 1 Data Strobe 5
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[6]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[6]"]
set_property PACKAGE_PIN       BD24            [get_ports "m0_ddr4_dqs_c[6]"]; #Dimm 1 Data Strobe 6
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[7]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[7]"]
set_property PACKAGE_PIN       BF22            [get_ports "m0_ddr4_dqs_c[7]"]; #Dimm 1 Data Strobe 7
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[8]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[8]"]
set_property PACKAGE_PIN       AT13            [get_ports "m0_ddr4_dqs_c[8]"]; #Dimm 1 Data Strobe 8
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[9]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[9]"]
set_property PACKAGE_PIN       AP14            [get_ports "m0_ddr4_dqs_c[9]"]; #Dimm 1 Data Strobe 9
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[10]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[10]"]
set_property PACKAGE_PIN       AY15            [get_ports "m0_ddr4_dqs_c[10]"]; #Dimm 1 Data Strobe 10
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[11]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[11]"]
set_property PACKAGE_PIN       AY12            [get_ports "m0_ddr4_dqs_c[11]"]; #Dimm 1 Data Strobe 11
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[12]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[12]"]
set_property PACKAGE_PIN       BB10            [get_ports "m0_ddr4_dqs_c[12]"]; #Dimm 1 Data Strobe 12
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[13]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[13]"]
set_property PACKAGE_PIN       BA9             [get_ports "m0_ddr4_dqs_c[13]"]; #Dimm 1 Data Strobe 13
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[14]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[14]"]
set_property PACKAGE_PIN       BF9             [get_ports "m0_ddr4_dqs_c[14]"]; #Dimm 1 Data Strobe 14
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[15]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[15]"]
set_property PACKAGE_PIN       BF8             [get_ports "m0_ddr4_dqs_c[15]"]; #Dimm 1 Data Strobe 15
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[16]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[16]"]
set_property PACKAGE_PIN       BE11            [get_ports "m0_ddr4_dqs_c[16]"]; #Dimm 1 Data Strobe 16
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_c[17]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_c[17]"]
set_property PACKAGE_PIN       BF15            [get_ports "m0_ddr4_dqs_c[17]"]; #Dimm 1 Data Strobe 17
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[0]"]
set_property PACKAGE_PIN       AL25            [get_ports "m0_ddr4_dqs_t[0]"]; #Dimm 1 Data Strobe 0
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[1]"]
set_property PACKAGE_PIN       AN23            [get_ports "m0_ddr4_dqs_t[1]"]; #Dimm 1 Data Strobe 1
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[2]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[2]"]
set_property PACKAGE_PIN       AR23            [get_ports "m0_ddr4_dqs_t[2]"]; #Dimm 1 Data Strobe 2
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[3]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[3]"]
set_property PACKAGE_PIN       AW25            [get_ports "m0_ddr4_dqs_t[3]"]; #Dimm 1 Data Strobe 3
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[4]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[4]"]
set_property PACKAGE_PIN       AY22            [get_ports "m0_ddr4_dqs_t[4]"]; #Dimm 1 Data Strobe 4
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[5]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[5]"]
set_property PACKAGE_PIN       BB22            [get_ports "m0_ddr4_dqs_t[5]"]; #Dimm 1 Data Strobe 5
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[6]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[6]"]
set_property PACKAGE_PIN       BC24            [get_ports "m0_ddr4_dqs_t[6]"]; #Dimm 1 Data Strobe 6
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[7]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[7]"]
set_property PACKAGE_PIN       BE22            [get_ports "m0_ddr4_dqs_t[7]"]; #Dimm 1 Data Strobe 7
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[8]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[8]"]
set_property PACKAGE_PIN       AT14            [get_ports "m0_ddr4_dqs_t[8]"]; #Dimm 1 Data Strobe 8
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[9]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[9]"]
set_property PACKAGE_PIN       AN14            [get_ports "m0_ddr4_dqs_t[9]"]; #Dimm 1 Data Strobe 9
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[10]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[10]"]
set_property PACKAGE_PIN       AW15            [get_ports "m0_ddr4_dqs_t[10]"]; #Dimm 1 Data Strobe 10
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[11]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[11]"]
set_property PACKAGE_PIN       AY13            [get_ports "m0_ddr4_dqs_t[11]"]; #Dimm 1 Data Strobe 11
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[12]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[12]"]
set_property PACKAGE_PIN       BB11            [get_ports "m0_ddr4_dqs_t[12]"]; #Dimm 1 Data Strobe 12
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[13]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[13]"]
set_property PACKAGE_PIN       BA10            [get_ports "m0_ddr4_dqs_t[13]"]; #Dimm 1 Data Strobe 13
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[14]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[14]"]
set_property PACKAGE_PIN       BF10            [get_ports "m0_ddr4_dqs_t[14]"]; #Dimm 1 Data Strobe 14
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[15]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[15]"]
set_property PACKAGE_PIN       BE8            [get_ports "m0_ddr4_dqs_t[15]"]; #Dimm 1 Data Strobe 15
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[16]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[16]"]
set_property PACKAGE_PIN       BE12            [get_ports "m0_ddr4_dqs_t[16]"]; #Dimm 1 Data Strobe 16
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports "m0_ddr4_dqs_t[17]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dqs_t[17]"]
set_property PACKAGE_PIN       BE15            [get_ports "m0_ddr4_dqs_t[17]"]; #Dimm 1 Data Strobe 17
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[0]"]
set_property PACKAGE_PIN       AN26            [get_ports "m0_ddr4_dq[0]"]; #Dimm 1 Data Pin 0
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[1]"]
set_property PACKAGE_PIN       AM26            [get_ports "m0_ddr4_dq[1]"]; #Dimm 1 Data Pin 1
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[2]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[2]"]
set_property PACKAGE_PIN       AR26            [get_ports "m0_ddr4_dq[2]"]; #Dimm 1 Data Pin 2
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[3]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[3]"]
set_property PACKAGE_PIN       AR25            [get_ports "m0_ddr4_dq[3]"]; #Dimm 1 Data Pin 3
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[4]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[4]"]
set_property PACKAGE_PIN       AP24            [get_ports "m0_ddr4_dq[4]"]; #Dimm 1 Data Pin 4
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[5]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[5]"]
set_property PACKAGE_PIN       AP23            [get_ports "m0_ddr4_dq[5]"]; #Dimm 1 Data Pin 5
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[6]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[6]"]
set_property PACKAGE_PIN       AM24            [get_ports "m0_ddr4_dq[6]"]; #Dimm 1 Data Pin 6
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[7]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[7]"]
set_property PACKAGE_PIN       AL24            [get_ports "m0_ddr4_dq[7]"]; #Dimm 1 Data Pin 7
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[8]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[8]"]
set_property PACKAGE_PIN       AU24            [get_ports "m0_ddr4_dq[8]"]; #Dimm 1 Data Pin 8
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[9]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[9]"]
set_property PACKAGE_PIN       AT24            [get_ports "m0_ddr4_dq[9]"]; #Dimm 1 Data Pin 9
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[10]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[10]"]
set_property PACKAGE_PIN       AV26            [get_ports "m0_ddr4_dq[10]"]; #Dimm 1 Data Pin 10
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[11]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[11]"]
set_property PACKAGE_PIN       AU26            [get_ports "m0_ddr4_dq[11]"]; #Dimm 1 Data Pin 11
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[12]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[12]"]
set_property PACKAGE_PIN       AU25            [get_ports "m0_ddr4_dq[12]"]; #Dimm 1 Data Pin 12
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[13]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[13]"]
set_property PACKAGE_PIN       AT25            [get_ports "m0_ddr4_dq[13]"]; #Dimm 1 Data Pin 13
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[14]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[14]"]
set_property PACKAGE_PIN       AV24            [get_ports "m0_ddr4_dq[14]"]; #Dimm 1 Data Pin 14
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[15]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[15]"]
set_property PACKAGE_PIN       AV23            [get_ports "m0_ddr4_dq[15]"]; #Dimm 1 Data Pin 15
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[16]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[16]"]
set_property PACKAGE_PIN       AW24            [get_ports "m0_ddr4_dq[16]"]; #Dimm 1 Data Pin 16
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[17]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[17]"]
set_property PACKAGE_PIN       AW23            [get_ports "m0_ddr4_dq[17]"]; #Dimm 1 Data Pin 17
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[18]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[18]"]
set_property PACKAGE_PIN       AY26            [get_ports "m0_ddr4_dq[18]"]; #Dimm 1 Data Pin 18
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[19]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[19]"]
set_property PACKAGE_PIN       AY25            [get_ports "m0_ddr4_dq[19]"]; #Dimm 1 Data Pin 19
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[20]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[20]"]
set_property PACKAGE_PIN       BB25            [get_ports "m0_ddr4_dq[20]"]; #Dimm 1 Data Pin 20
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[21]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[21]"]
set_property PACKAGE_PIN       BB24            [get_ports "m0_ddr4_dq[21]"]; #Dimm 1 Data Pin 21
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[22]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[22]"]
set_property PACKAGE_PIN       BA23            [get_ports "m0_ddr4_dq[22]"]; #Dimm 1 Data Pin 22
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[23]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[23]"]
set_property PACKAGE_PIN       BA22            [get_ports "m0_ddr4_dq[23]"]; #Dimm 1 Data Pin 23
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[24]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[24]"]
set_property PACKAGE_PIN       BE25            [get_ports "m0_ddr4_dq[24]"]; #Dimm 1 Data Pin 24
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[25]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[25]"]
set_property PACKAGE_PIN       BD25            [get_ports "m0_ddr4_dq[25]"]; #Dimm 1 Data Pin 25
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[26]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[26]"]
set_property PACKAGE_PIN       BF25            [get_ports "m0_ddr4_dq[26]"]; #Dimm 1 Data Pin 26
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[27]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[27]"]
set_property PACKAGE_PIN       BF24            [get_ports "m0_ddr4_dq[27]"]; #Dimm 1 Data Pin 27
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[28]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[28]"]
set_property PACKAGE_PIN       BF23            [get_ports "m0_ddr4_dq[28]"]; #Dimm 1 Data Pin 28
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[29]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[29]"]
set_property PACKAGE_PIN       BE23            [get_ports "m0_ddr4_dq[29]"]; #Dimm 1 Data Pin 29
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[30]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[30]"]
set_property PACKAGE_PIN       BD23            [get_ports "m0_ddr4_dq[30]"]; #Dimm 1 Data Pin 30
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[31]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[31]"]
set_property PACKAGE_PIN       BC23            [get_ports "m0_ddr4_dq[31]"]; #Dimm 1 Data Pin 31
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[32]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[32]"]
set_property PACKAGE_PIN       AR13            [get_ports "m0_ddr4_dq[32]"]; #Dimm 1 Data Pin 32
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[33]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[33]"]
set_property PACKAGE_PIN       AP13            [get_ports "m0_ddr4_dq[33]"]; #Dimm 1 Data Pin 33
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[34]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[34]"]
set_property PACKAGE_PIN       AN13            [get_ports "m0_ddr4_dq[34]"]; #Dimm 1 Data Pin 34
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[35]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[35]"]
set_property PACKAGE_PIN       AM13            [get_ports "m0_ddr4_dq[35]"]; #Dimm 1 Data Pin 35
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[36]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[36]"]
set_property PACKAGE_PIN       AM14            [get_ports "m0_ddr4_dq[36]"]; #Dimm 1 Data Pin 36
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[37]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[37]"]
set_property PACKAGE_PIN       AL14            [get_ports "m0_ddr4_dq[37]"]; #Dimm 1 Data Pin 37
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[38]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[38]"]
set_property PACKAGE_PIN       AT15            [get_ports "m0_ddr4_dq[38]"]; #Dimm 1 Data Pin 38
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[39]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[39]"]
set_property PACKAGE_PIN       AR15            [get_ports "m0_ddr4_dq[39]"]; #Dimm 1 Data Pin 39
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[40]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[40]"]
set_property PACKAGE_PIN       AW13            [get_ports "m0_ddr4_dq[40]"]; #Dimm 1 Data Pin 40
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[41]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[41]"]
set_property PACKAGE_PIN       AW14            [get_ports "m0_ddr4_dq[41]"]; #Dimm 1 Data Pin 41
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[42]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[42]"]
set_property PACKAGE_PIN       AV13            [get_ports "m0_ddr4_dq[42]"]; #Dimm 1 Data Pin 42
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[43]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[43]"]
set_property PACKAGE_PIN       AU13            [get_ports "m0_ddr4_dq[43]"]; #Dimm 1 Data Pin 43
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[44]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[44]"]
set_property PACKAGE_PIN       AV14            [get_ports "m0_ddr4_dq[44]"]; #Dimm 1 Data Pin 44
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[45]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[45]"]
set_property PACKAGE_PIN       AU14            [get_ports "m0_ddr4_dq[45]"]; #Dimm 1 Data Pin 45
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[46]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[46]"]
set_property PACKAGE_PIN       BA11            [get_ports "m0_ddr4_dq[46]"]; #Dimm 1 Data Pin 46
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[47]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[47]"]
set_property PACKAGE_PIN       AY11            [get_ports "m0_ddr4_dq[47]"]; #Dimm 1 Data Pin 47
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[48]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[48]"]
set_property PACKAGE_PIN       BB12            [get_ports "m0_ddr4_dq[48]"]; #Dimm 1 Data Pin 48
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[49]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[49]"]
set_property PACKAGE_PIN       BA12            [get_ports "m0_ddr4_dq[49]"]; #Dimm 1 Data Pin 49
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[50]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[50]"]
set_property PACKAGE_PIN       BA13            [get_ports "m0_ddr4_dq[50]"]; #Dimm 1 Data Pin 50
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[51]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[51]"]
set_property PACKAGE_PIN       BA14            [get_ports "m0_ddr4_dq[51]"]; #Dimm 1 Data Pin 51
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[52]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[52]"]
set_property PACKAGE_PIN       BA7             [get_ports "m0_ddr4_dq[52]"]; #Dimm 1 Data Pin 52
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[53]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[53]"]
set_property PACKAGE_PIN       BA8             [get_ports "m0_ddr4_dq[53]"]; #Dimm 1 Data Pin 53
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[54]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[54]"]
set_property PACKAGE_PIN       BC9             [get_ports "m0_ddr4_dq[54]"]; #Dimm 1 Data Pin 54
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[55]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[55]"]
set_property PACKAGE_PIN       BB9             [get_ports "m0_ddr4_dq[55]"]; #Dimm 1 Data Pin 55
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[56]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[56]"]
set_property PACKAGE_PIN       BD8             [get_ports "m0_ddr4_dq[56]"]; #Dimm 1 Data Pin 56
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[57]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[57]"]
set_property PACKAGE_PIN       BD9             [get_ports "m0_ddr4_dq[57]"]; #Dimm 1 Data Pin 57
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[58]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[58]"]
set_property PACKAGE_PIN       BD7             [get_ports "m0_ddr4_dq[58]"]; #Dimm 1 Data Pin 58
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[59]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[59]"]
set_property PACKAGE_PIN       BC7             [get_ports "m0_ddr4_dq[59]"]; #Dimm 1 Data Pin 59
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[60]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[60]"]
set_property PACKAGE_PIN       BF7             [get_ports "m0_ddr4_dq[60]"]; #Dimm 1 Data Pin 60
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[61]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[61]"]
set_property PACKAGE_PIN       BE7             [get_ports "m0_ddr4_dq[61]"]; #Dimm 1 Data Pin 61
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[62]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[62]"]
set_property PACKAGE_PIN       BE10            [get_ports "m0_ddr4_dq[62]"]; #Dimm 1 Data Pin 62
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[63]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[63]"]
set_property PACKAGE_PIN       BD10            [get_ports "m0_ddr4_dq[63]"]; #Dimm 1 Data Pin 63
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[64]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[64]"]
set_property PACKAGE_PIN       BF12            [get_ports "m0_ddr4_dq[64]"]; #Dimm 1 Data Pin 64
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[65]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[65]"]
set_property PACKAGE_PIN       BE13            [get_ports "m0_ddr4_dq[65]"]; #Dimm 1 Data Pin 65
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[66]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[66]"]
set_property PACKAGE_PIN       BD13            [get_ports "m0_ddr4_dq[66]"]; #Dimm 1 Data Pin 66
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[67]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[67]"]
set_property PACKAGE_PIN       BD14            [get_ports "m0_ddr4_dq[67]"]; #Dimm 1 Data Pin 67
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[68]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[68]"]
set_property PACKAGE_PIN       BD15            [get_ports "m0_ddr4_dq[68]"]; #Dimm 1 Data Pin 68
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[69]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[69]"]
set_property PACKAGE_PIN       BD16            [get_ports "m0_ddr4_dq[69]"]; #Dimm 1 Data Pin 69
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[70]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[70]"]
set_property PACKAGE_PIN       BF13            [get_ports "m0_ddr4_dq[70]"]; #Dimm 1 Data Pin 70
set_property IOSTANDARD        POD12_DCI       [get_ports "m0_ddr4_dq[71]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_dq[71]"]
set_property PACKAGE_PIN       BF14            [get_ports "m0_ddr4_dq[71]"]; #Dimm 1 Data Pin 71
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_odt[0]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_odt[0]"]
set_property PACKAGE_PIN       BC12            [get_ports "m0_ddr4_odt[0]"]; #Dimm 1 On Die Termination 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_odt[1]"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_odt[1]"]
set_property PACKAGE_PIN       BA18            [get_ports "m0_ddr4_odt[1]"]; #Dimm 1 On Die Termination 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports "m0_ddr4_parity"]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports "m0_ddr4_parity"]
set_property PACKAGE_PIN       BA17            [get_ports "m0_ddr4_parity"]; #Dimm 1 Parity
set_property IOSTANDARD        LVCMOS12        [get_ports "m0_ddr4_reset_n"]
set_property PACKAGE_PIN       BB14            [get_ports "m0_ddr4_reset_n"]; #Dimm 1 Active Low Reset
### RDIMM 2
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_act_n ]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_act_n ]
set_property PACKAGE_PIN       BC36            [get_ports m1_ddr4_act_n ]     ; #Dimm 2 Activation Command Low
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[0]]
set_property PACKAGE_PIN       AW31            [get_ports m1_ddr4_adr[0]]    ; #Dimm 2 Address 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[1]]
set_property PACKAGE_PIN       AY31            [get_ports m1_ddr4_adr[1]]    ; #Dimm 2 Address 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[2]]
set_property PACKAGE_PIN       AV31            [get_ports m1_ddr4_adr[2]]    ; #Dimm 2 Address 2
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[3]]
set_property PACKAGE_PIN       AV32            [get_ports m1_ddr4_adr[3]]    ; #Dimm 2 Address 3
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[4]]
set_property PACKAGE_PIN       AV34            [get_ports m1_ddr4_adr[4]]    ; #Dimm 2 Address 4
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[5]]
set_property PACKAGE_PIN       AW34            [get_ports m1_ddr4_adr[5]]    ; #Dimm 2 Address 5
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[6]]
set_property PACKAGE_PIN       AU31            [get_ports m1_ddr4_adr[6]]    ; #Dimm 2 Address 6
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[7]]
set_property PACKAGE_PIN       AP30            [get_ports m1_ddr4_adr[7]]    ; #Dimm 2 Address 7
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[8]]
set_property PACKAGE_PIN       AP31            [get_ports m1_ddr4_adr[8]]    ; #Dimm 2 Address 8
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[9]]
set_property PACKAGE_PIN       AN31            [get_ports m1_ddr4_adr[9]]    ; #Dimm 2 Address 9
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[10]]
set_property PACKAGE_PIN       AN32            [get_ports m1_ddr4_adr[10]]   ; #Dimm 2 Address 10
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[11]]
set_property PACKAGE_PIN       AR31            [get_ports m1_ddr4_adr[11]]   ; #Dimm 2 Address 11
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[12]]
set_property PACKAGE_PIN       AR32            [get_ports m1_ddr4_adr[12]]   ; #Dimm 2 Address 12
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[13]]
set_property PACKAGE_PIN       AT32            [get_ports m1_ddr4_adr[13]]   ; #Dimm 2 Address 13
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[14]]
set_property PACKAGE_PIN       AU32            [get_ports m1_ddr4_adr[14]]   ; #Dimm 2 Address 14
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[15]]
set_property PACKAGE_PIN       AL30            [get_ports m1_ddr4_adr[15]]   ; #Dimm 2 Address 15
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_adr[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_adr[16]]
set_property PACKAGE_PIN       AM30            [get_ports m1_ddr4_adr[16]]   ; #Dimm 2 Address 16
set_property PACKAGE_PIN       AT33            [get_ports m1_ddr4_adr[17]]   ; #Dimm 2 Address 17
set_property PACKAGE_PIN       AM31            [get_ports m1_ddr4_alert_n ]   ; #Dimm 2 Active Low Alert
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_ba[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_ba[0]]
set_property PACKAGE_PIN       BA32            [get_ports m1_ddr4_ba[0]]     ; #Dimm 2 Bank Address 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_ba[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_ba[1]]
set_property PACKAGE_PIN       BA33            [get_ports m1_ddr4_ba[1]]     ; #Dimm 2 Bank Address 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_bg[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_bg[0]]
set_property PACKAGE_PIN       BA34            [get_ports m1_ddr4_bg[0]]     ; #Dimm 2 Bank Group 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_bg[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_bg[1]]
set_property PACKAGE_PIN       BA35            [get_ports m1_ddr4_bg[1]]     ; #Dimm 2 Bank Group 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_c[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_c[0]]
set_property PACKAGE_PIN       BD31            [get_ports m1_ddr4_c[0]]      ; #Dimm 2 Active Low Chip Select 2
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_c[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_c[1]]
set_property PACKAGE_PIN       BB34            [get_ports m1_ddr4_c[1]]      ; #Dimm 2 Active Low Chip Select 3
set_property PACKAGE_PIN       AM32            [get_ports m1_ddr4_c[2]]      ; #Dimm 2 Die Select
set_property PACKAGE_PIN       AT34            [get_ports m1_ddr4_c[3]]      ; #Dimm 2 RFU
set_property PACKAGE_PIN       AT29            [get_ports m1_ddr4_c[4]]      ; #Dimm 2 RFU
set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports m1_ddr4_ck_c[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_ck_c[0]]
set_property PACKAGE_PIN       AW33            [get_ports m1_ddr4_ck_c ]      ; #Dimm 2 Clock
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_cke[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_cke[0]]
set_property PACKAGE_PIN       BC33            [get_ports m1_ddr4_cke[0]]    ; #Dimm 2 Clock Enable 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_cke[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_cke[1]]
set_property PACKAGE_PIN       BB35            [get_ports m1_ddr4_cke[1]]    ; #Dimm 2 Clock Enable 1
set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports m1_ddr4_ck_t[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_ck_t[0]]
set_property PACKAGE_PIN       AV33            [get_ports m1_ddr4_ck_t ]      ; #Dimm 2 Clock
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_cs_n[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_cs_n[0]]
set_property PACKAGE_PIN       BC34            [get_ports m1_ddr4_cs_n[0]]   ; #Dimm 2 Active Low Chip Select 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_cs_n[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_cs_n[1]]
set_property PACKAGE_PIN       BC32            [get_ports m1_ddr4_cs_n[1]]   ; #Dimm 2 Active Low Chip Select 1
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[0]]
set_property PACKAGE_PIN       AN36            [get_ports m1_ddr4_dq[0]]     ; #Dimm 2 Data Pin 0
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[1]]
set_property PACKAGE_PIN       AN35            [get_ports m1_ddr4_dq[1]]     ; #Dimm 2 Data Pin 1
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[2]]
set_property PACKAGE_PIN       AR36            [get_ports m1_ddr4_dq[2]]     ; #Dimm 2 Data Pin 2
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[3]]
set_property PACKAGE_PIN       AP36            [get_ports m1_ddr4_dq[3]]     ; #Dimm 2 Data Pin 3
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[4]]
set_property PACKAGE_PIN       AP35            [get_ports m1_ddr4_dq[4]]     ; #Dimm 2 Data Pin 4
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[5]]
set_property PACKAGE_PIN       AP34            [get_ports m1_ddr4_dq[5]]     ; #Dimm 2 Data Pin 5
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[6]]
set_property PACKAGE_PIN       AP33            [get_ports m1_ddr4_dq[6]]     ; #Dimm 2 Data Pin 6
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[7]]
set_property PACKAGE_PIN       AN33            [get_ports m1_ddr4_dq[7]]     ; #Dimm 2 Data Pin 7
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[8]]
set_property PACKAGE_PIN       AU36            [get_ports m1_ddr4_dq[8]]     ; #Dimm 2 Data Pin 8
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[9]]
set_property PACKAGE_PIN       AT36            [get_ports m1_ddr4_dq[9]]     ; #Dimm 2 Data Pin 9
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[10]]
set_property PACKAGE_PIN       AW38            [get_ports m1_ddr4_dq[10]]    ; #Dimm 2 Data Pin 10
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[11]]
set_property PACKAGE_PIN       AV38            [get_ports m1_ddr4_dq[11]]    ; #Dimm 2 Data Pin 11
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[12]]
set_property PACKAGE_PIN       AV37            [get_ports m1_ddr4_dq[12]]    ; #Dimm 2 Data Pin 12
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[13]]
set_property PACKAGE_PIN       AV36            [get_ports m1_ddr4_dq[13]]    ; #Dimm 2 Data Pin 13
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[14]]
set_property PACKAGE_PIN       AW36            [get_ports m1_ddr4_dq[14]]    ; #Dimm 2 Data Pin 14
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[15]]
set_property PACKAGE_PIN       AW35            [get_ports m1_ddr4_dq[15]]    ; #Dimm 2 Data Pin 15
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[16]]
set_property PACKAGE_PIN       AY36            [get_ports m1_ddr4_dq[16]]    ; #Dimm 2 Data Pin 16
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[17]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[17]]
set_property PACKAGE_PIN       AY35            [get_ports m1_ddr4_dq[17]]    ; #Dimm 2 Data Pin 17
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[18]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[18]]
set_property PACKAGE_PIN       BA38            [get_ports m1_ddr4_dq[18]]    ; #Dimm 2 Data Pin 18
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[19]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[19]]
set_property PACKAGE_PIN       BA37            [get_ports m1_ddr4_dq[19]]    ; #Dimm 2 Data Pin 19
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[20]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[20]]
set_property PACKAGE_PIN       BC40            [get_ports m1_ddr4_dq[20]]    ; #Dimm 2 Data Pin 20
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[21]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[21]]
set_property PACKAGE_PIN       BC39            [get_ports m1_ddr4_dq[21]]    ; #Dimm 2 Data Pin 21
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[22]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[22]]
set_property PACKAGE_PIN       BB40            [get_ports m1_ddr4_dq[22]]    ; #Dimm 2 Data Pin 22
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[23]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[23]]
set_property PACKAGE_PIN       BB39            [get_ports m1_ddr4_dq[23]]    ; #Dimm 2 Data Pin 23
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[24]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[24]]
set_property PACKAGE_PIN       BD40            [get_ports m1_ddr4_dq[24]]    ; #Dimm 2 Data Pin 24
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[25]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[25]]
set_property PACKAGE_PIN       BD39            [get_ports m1_ddr4_dq[25]]    ; #Dimm 2 Data Pin 25
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[26]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[26]]
set_property PACKAGE_PIN       BF43            [get_ports m1_ddr4_dq[26]]    ; #Dimm 2 Data Pin 26
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[27]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[27]]
set_property PACKAGE_PIN       BF42            [get_ports m1_ddr4_dq[27]]    ; #Dimm 2 Data Pin 27
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[28]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[28]]
set_property PACKAGE_PIN       BF41            [get_ports m1_ddr4_dq[28]]    ; #Dimm 2 Data Pin 28
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[29]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[29]]
set_property PACKAGE_PIN       BE40            [get_ports m1_ddr4_dq[29]]    ; #Dimm 2 Data Pin 29
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[30]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[30]]
set_property PACKAGE_PIN       BF37            [get_ports m1_ddr4_dq[30]]    ; #Dimm 2 Data Pin 30
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[31]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[31]]
set_property PACKAGE_PIN       BE37            [get_ports m1_ddr4_dq[31]]    ; #Dimm 2 Data Pin 31
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[32]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[32]]
set_property PACKAGE_PIN       AN27            [get_ports m1_ddr4_dq[32]]    ; #Dimm 2 Data Pin 32
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[33]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[33]]
set_property PACKAGE_PIN       AM27            [get_ports m1_ddr4_dq[33]]    ; #Dimm 2 Data Pin 33
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[34]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[34]]
set_property PACKAGE_PIN       AP29            [get_ports m1_ddr4_dq[34]]    ; #Dimm 2 Data Pin 34
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[35]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[35]]
set_property PACKAGE_PIN       AP28            [get_ports m1_ddr4_dq[35]]    ; #Dimm 2 Data Pin 35
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[36]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[36]]
set_property PACKAGE_PIN       AR28            [get_ports m1_ddr4_dq[36]]    ; #Dimm 2 Data Pin 36
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[37]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[37]]
set_property PACKAGE_PIN       AR27            [get_ports m1_ddr4_dq[37]]    ; #Dimm 2 Data Pin 37
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[38]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[38]]
set_property PACKAGE_PIN       AN29            [get_ports m1_ddr4_dq[38]]    ; #Dimm 2 Data Pin 38
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[39]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[39]]
set_property PACKAGE_PIN       AM29            [get_ports m1_ddr4_dq[39]]    ; #Dimm 2 Data Pin 39
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[40]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[40]]
set_property PACKAGE_PIN       AT28            [get_ports m1_ddr4_dq[40]]    ; #Dimm 2 Data Pin 40
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[41]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[41]]
set_property PACKAGE_PIN       AT27            [get_ports m1_ddr4_dq[41]]    ; #Dimm 2 Data Pin 41
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[42]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[42]]
set_property PACKAGE_PIN       AV27            [get_ports m1_ddr4_dq[42]]    ; #Dimm 2 Data Pin 42
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[43]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[43]]
set_property PACKAGE_PIN       AU27            [get_ports m1_ddr4_dq[43]]    ; #Dimm 2 Data Pin 43
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[44]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[44]]
set_property PACKAGE_PIN       AV29            [get_ports m1_ddr4_dq[44]]    ; #Dimm 2 Data Pin 44
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[45]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[45]]
set_property PACKAGE_PIN       AV28            [get_ports m1_ddr4_dq[45]]    ; #Dimm 2 Data Pin 45
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[46]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[46]]
set_property PACKAGE_PIN       AY30            [get_ports m1_ddr4_dq[46]]    ; #Dimm 2 Data Pin 46
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[47]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[47]]
set_property PACKAGE_PIN       AW30            [get_ports m1_ddr4_dq[47]]    ; #Dimm 2 Data Pin 47
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[48]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[48]]
set_property PACKAGE_PIN       AW29            [get_ports m1_ddr4_dq[48]]    ; #Dimm 2 Data Pin 48
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[49]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[49]]
set_property PACKAGE_PIN       AW28            [get_ports m1_ddr4_dq[49]]    ; #Dimm 2 Data Pin 49
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[50]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[50]]
set_property PACKAGE_PIN       BA28            [get_ports m1_ddr4_dq[50]]    ; #Dimm 2 Data Pin 50
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[51]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[51]]
set_property PACKAGE_PIN       BA27            [get_ports m1_ddr4_dq[51]]    ; #Dimm 2 Data Pin 51
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[52]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[52]]
set_property PACKAGE_PIN       BC27            [get_ports m1_ddr4_dq[52]]    ; #Dimm 2 Data Pin 52
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[53]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[53]]
set_property PACKAGE_PIN       BB27            [get_ports m1_ddr4_dq[53]]    ; #Dimm 2 Data Pin 53
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[54]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[54]]
set_property PACKAGE_PIN       BB29            [get_ports m1_ddr4_dq[54]]    ; #Dimm 2 Data Pin 54
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[55]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[55]]
set_property PACKAGE_PIN       BA29            [get_ports m1_ddr4_dq[55]]    ; #Dimm 2 Data Pin 55
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[56]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[56]]
set_property PACKAGE_PIN       BE30            [get_ports m1_ddr4_dq[56]]    ; #Dimm 2 Data Pin 56
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[57]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[57]]
set_property PACKAGE_PIN       BD30            [get_ports m1_ddr4_dq[57]]    ; #Dimm 2 Data Pin 57
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[58]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[58]]
set_property PACKAGE_PIN       BF28            [get_ports m1_ddr4_dq[58]]    ; #Dimm 2 Data Pin 58
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[59]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[59]]
set_property PACKAGE_PIN       BE28            [get_ports m1_ddr4_dq[59]]    ; #Dimm 2 Data Pin 59
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[60]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[60]]
set_property PACKAGE_PIN       BF27            [get_ports m1_ddr4_dq[60]]    ; #Dimm 2 Data Pin 60
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[61]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[61]]
set_property PACKAGE_PIN       BE27            [get_ports m1_ddr4_dq[61]]    ; #Dimm 2 Data Pin 61
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[62]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[62]]
set_property PACKAGE_PIN       BF30            [get_ports m1_ddr4_dq[62]]    ; #Dimm 2 Data Pin 62
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[63]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[63]]
set_property PACKAGE_PIN       BF29            [get_ports m1_ddr4_dq[63]]    ; #Dimm 2 Data Pin 63
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[64]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[64]]
set_property PACKAGE_PIN       BD35            [get_ports m1_ddr4_dq[64]]    ; #Dimm 2 Data Pin 64
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[65]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[65]]
set_property PACKAGE_PIN       BD34            [get_ports m1_ddr4_dq[65]]    ; #Dimm 2 Data Pin 65
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[66]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[66]]
set_property PACKAGE_PIN       BE33            [get_ports m1_ddr4_dq[66]]    ; #Dimm 2 Data Pin 66
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[67]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[67]]
set_property PACKAGE_PIN       BD33            [get_ports m1_ddr4_dq[67]]    ; #Dimm 2 Data Pin 67
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[68]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[68]]
set_property PACKAGE_PIN       BF33            [get_ports m1_ddr4_dq[68]]    ; #Dimm 2 Data Pin 68
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[69]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[69]]
set_property PACKAGE_PIN       BF32            [get_ports m1_ddr4_dq[69]]    ; #Dimm 2 Data Pin 69
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[70]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[70]]
set_property PACKAGE_PIN       BF35            [get_ports m1_ddr4_dq[70]]    ; #Dimm 2 Data Pin 70
set_property IOSTANDARD        POD12_DCI       [get_ports m1_ddr4_dq[71]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dq[71]]
set_property PACKAGE_PIN       BF34            [get_ports m1_ddr4_dq[71]]    ; #Dimm 2 Data Pin 71
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[0]]
set_property PACKAGE_PIN       AN34            [get_ports m1_ddr4_dqs_c[0]]  ; #Dimm 2 Data Strobe 0
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[1]]
set_property PACKAGE_PIN       AT35            [get_ports m1_ddr4_dqs_c[1]]  ; #Dimm 2 Data Strobe 1
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[2]]
set_property PACKAGE_PIN       AU35            [get_ports m1_ddr4_dqs_c[2]]  ; #Dimm 2 Data Strobe 2
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[3]]
set_property PACKAGE_PIN       AY38            [get_ports m1_ddr4_dqs_c[3]]  ; #Dimm 2 Data Strobe 3
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[4]]
set_property PACKAGE_PIN       BA40            [get_ports m1_ddr4_dqs_c[4]]  ; #Dimm 2 Data Strobe 4
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[5]]
set_property PACKAGE_PIN       BC38            [get_ports m1_ddr4_dqs_c[5]]  ; #Dimm 2 Data Strobe 5
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[6]]
set_property PACKAGE_PIN       BF38            [get_ports m1_ddr4_dqs_c[6]]  ; #Dimm 2 Data Strobe 6
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[7]]
set_property PACKAGE_PIN       BF40            [get_ports m1_ddr4_dqs_c[7]]  ; #Dimm 2 Data Strobe 7
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[8]]
set_property PACKAGE_PIN       AL29            [get_ports m1_ddr4_dqs_c[8]]  ; #Dimm 2 Data Strobe 8
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[9]]
set_property PACKAGE_PIN       AT30            [get_ports m1_ddr4_dqs_c[9]]  ; #Dimm 2 Data Strobe 9
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[10]] 
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[10]]
set_property PACKAGE_PIN       AU30            [get_ports m1_ddr4_dqs_c[10]]; #Dimm 2 Data Strobe 10
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[11]]
set_property PACKAGE_PIN       AY28            [get_ports m1_ddr4_dqs_c[11]]; #Dimm 2 Data Strobe 11
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[12]]
set_property PACKAGE_PIN       BB30            [get_ports m1_ddr4_dqs_c[12]]; #Dimm 2 Data Strobe 12
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[13]]
set_property PACKAGE_PIN       BC26            [get_ports m1_ddr4_dqs_c[13]]; #Dimm 2 Data Strobe 13
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[14]]
set_property PACKAGE_PIN       BD29            [get_ports m1_ddr4_dqs_c[14]]; #Dimm 2 Data Strobe 14
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[15]]
set_property PACKAGE_PIN       BE26            [get_ports m1_ddr4_dqs_c[15]]; #Dimm 2 Data Strobe 15
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[16]]
set_property PACKAGE_PIN       BE36            [get_ports m1_ddr4_dqs_c[16]]; #Dimm 2 Data Strobe 16
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_c[17]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_c[17]]
set_property PACKAGE_PIN       BE32            [get_ports m1_ddr4_dqs_c[17]]; #Dimm 2 Data Strobe 17
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[0]]
set_property PACKAGE_PIN       AM34            [get_ports m1_ddr4_dqs_t[0]]  ; #Dimm 2 Data Strobe 0
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[1]]
set_property PACKAGE_PIN       AR35            [get_ports m1_ddr4_dqs_t[1]]  ; #Dimm 2 Data Strobe 1
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[2]]
set_property PACKAGE_PIN       AU34            [get_ports m1_ddr4_dqs_t[2]]  ; #Dimm 2 Data Strobe 2
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[3]]
set_property PACKAGE_PIN       AY37            [get_ports m1_ddr4_dqs_t[3]]  ; #Dimm 2 Data Strobe 3
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[4]]
set_property PACKAGE_PIN       BA39            [get_ports m1_ddr4_dqs_t[4]]  ; #Dimm 2 Data Strobe 4
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[5]]
set_property PACKAGE_PIN       BC37            [get_ports m1_ddr4_dqs_t[5]]  ; #Dimm 2 Data Strobe 5
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[6]]
set_property PACKAGE_PIN       BE38            [get_ports m1_ddr4_dqs_t[6]]  ; #Dimm 2 Data Strobe 6
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[7]]
set_property PACKAGE_PIN       BF39            [get_ports m1_ddr4_dqs_t[7]]  ; #Dimm 2 Data Strobe 7
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[8]]
set_property PACKAGE_PIN       AL28            [get_ports m1_ddr4_dqs_t[8]]  ; #Dimm 2 Data Strobe 8
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[9]]
set_property PACKAGE_PIN       AR30            [get_ports m1_ddr4_dqs_t[9]]  ; #Dimm 2 Data Strobe 9
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[10]]
set_property PACKAGE_PIN       AU29            [get_ports m1_ddr4_dqs_t[10]]; #Dimm 2 Data Strobe 10
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[11]]
set_property PACKAGE_PIN       AY27            [get_ports m1_ddr4_dqs_t[11]]; #Dimm 2 Data Strobe 11
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[12]]
set_property PACKAGE_PIN       BA30            [get_ports m1_ddr4_dqs_t[12]]; #Dimm 2 Data Strobe 12
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[13]]
set_property PACKAGE_PIN       BB26            [get_ports m1_ddr4_dqs_t[13]]; #Dimm 2 Data Strobe 13
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[14]]
set_property PACKAGE_PIN       BD28            [get_ports m1_ddr4_dqs_t[14]]; #Dimm 2 Data Strobe 14
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[15]]
set_property PACKAGE_PIN       BD26            [get_ports m1_ddr4_dqs_t[15]]; #Dimm 2 Data Strobe 15
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[16]]
set_property PACKAGE_PIN       BE35            [get_ports m1_ddr4_dqs_t[16]]; #Dimm 2 Data Strobe 16
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m1_ddr4_dqs_t[17]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_dqs_t[17]]
set_property PACKAGE_PIN       BE31            [get_ports m1_ddr4_dqs_t[17]]; #Dimm 2 Data Strobe 17
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_odt[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_odt[0]]
set_property PACKAGE_PIN       BB36            [get_ports m1_ddr4_odt[0]]    ; #Dimm 2 On Die Termination 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_odt[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_odt[1]]
set_property PACKAGE_PIN       AY32            [get_ports m1_ddr4_odt[1]]    ; #Dimm 2 On Die Termination 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m1_ddr4_parity ]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m1_ddr4_parity ]
set_property PACKAGE_PIN       AY33            [get_ports m1_ddr4_parity ]    ; #Dimm 2 Parity
set_property IOSTANDARD        LVCMOS12        [get_ports m1_ddr4_reset_n ]
set_property PACKAGE_PIN       BC31            [get_ports m1_ddr4_reset_n ]   ; #Dimm 2 Active Low Reset
#RDIMM3
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_act_n ]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_act_n ]
set_property PACKAGE_PIN       J31             [get_ports m2_ddr4_act_n ]     ; #Dimm 3 Activation Command Low
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[0]]
set_property PACKAGE_PIN       K30             [get_ports m2_ddr4_adr[0]]    ; #Dimm 3 Address Pin 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[1]]
set_property PACKAGE_PIN       K31             [get_ports m2_ddr4_adr[1]]    ; #Dimm 3 Address Pin 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[2]]
set_property PACKAGE_PIN       J29             [get_ports m2_ddr4_adr[2]]    ; #Dimm 3 Address Pin 2
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[3]]
set_property PACKAGE_PIN       J30             [get_ports m2_ddr4_adr[3]]    ; #Dimm 3 Address Pin 3
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[4]]
set_property PACKAGE_PIN       E31             [get_ports m2_ddr4_adr[4]]    ; #Dimm 3 Address Pin 4
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[5]]
set_property PACKAGE_PIN       D31             [get_ports m2_ddr4_adr[5]]    ; #Dimm 3 Address Pin 5
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[6]]
set_property PACKAGE_PIN       E30             [get_ports m2_ddr4_adr[6]]    ; #Dimm 3 Address Pin 6
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[7]]
set_property PACKAGE_PIN       C34             [get_ports m2_ddr4_adr[7]]    ; #Dimm 3 Address Pin 7
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[8]]
set_property PACKAGE_PIN       B34             [get_ports m2_ddr4_adr[8]]    ; #Dimm 3 Address Pin 8
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[9]]
set_property PACKAGE_PIN       B35             [get_ports m2_ddr4_adr[9]]    ; #Dimm 3 Address Pin 9
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[10]]
set_property PACKAGE_PIN       B36             [get_ports m2_ddr4_adr[10]]   ; #Dimm 3 Address Pin 10
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[11]]
set_property PACKAGE_PIN       C32             [get_ports m2_ddr4_adr[11]]   ; #Dimm 3 Address Pin 11
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[12]]
set_property PACKAGE_PIN       C33             [get_ports m2_ddr4_adr[12]]   ; #Dimm 3 Address Pin 12
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[13]]
set_property PACKAGE_PIN       B31             [get_ports m2_ddr4_adr[13]]   ; #Dimm 3 Address Pin 13
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[14]]
set_property PACKAGE_PIN       B32             [get_ports m2_ddr4_adr[14]]   ; #Dimm 3 Address Pin 14
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[15]]
set_property PACKAGE_PIN       A32             [get_ports m2_ddr4_adr[15]]   ; #Dimm 3 Address Pin 15
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_adr[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_adr[16]]
set_property PACKAGE_PIN       A33             [get_ports m2_ddr4_adr[16]]   ; #Dimm 3 Address Pin 16
set_property PACKAGE_PIN       C31             [get_ports m2_ddr4_adr[17]]   ; #Dimm 3 Address Pin 17
set_property PACKAGE_PIN       A34             [get_ports m2_ddr4_alert_n ]   ; #Dimm 3 Active Low Alert
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_ba[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_ba[0]]
set_property PACKAGE_PIN       F32             [get_ports m2_ddr4_ba[0]]     ; #Dimm 3 Bank Address 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_ba[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_ba[1]]
set_property PACKAGE_PIN       E32             [get_ports m2_ddr4_ba[1]]     ; #Dimm 3 Bank Address 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_bg[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_bg[0]]
set_property PACKAGE_PIN       E33             [get_ports m2_ddr4_bg[0]]     ; #Dimm 3 Bank Group 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_bg[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_bg[1]]
set_property PACKAGE_PIN       D33             [get_ports m2_ddr4_bg[1]]     ; #Dimm 3 Bank Address 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_c[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_c[0]]
set_property PACKAGE_PIN       M30             [get_ports m2_ddr4_c[0]]      ; #Dimm 3 Active Low Chip Select 2
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_c[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_c[1]]
set_property PACKAGE_PIN       H31             [get_ports m2_ddr4_c[1]]      ; #Dimm 3 Active Low Chip Select 3
set_property PACKAGE_PIN       A35             [get_ports m2_ddr4_c[2]]      ; #Dimm 3 Die Select
set_property PACKAGE_PIN       D36             [get_ports m2_ddr4_c[3]]      ; #Dimm 3 RFU
set_property PACKAGE_PIN       E26             [get_ports m2_ddr4_c[4]]      ; #Dimm 3 RFU
set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports m2_ddr4_ck_c[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_ck_c[0]]
set_property PACKAGE_PIN       D35             [get_ports m2_ddr4_ck_c ]      ; #Dimm 3 Clock
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_cke[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_cke[0]]
set_property PACKAGE_PIN       L30             [get_ports m2_ddr4_cke[0]]    ; #Dimm 3 Clock Enable 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_cke[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_cke[1]]
set_property PACKAGE_PIN       G31             [get_ports m2_ddr4_cke[1]]    ; #Dimm 3 Clock Enable 1
set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports m2_ddr4_ck_t[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_ck_t[0]]
set_property PACKAGE_PIN       D34             [get_ports m2_ddr4_ck_t ]      ; #Dimm 3 Clock
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_cs_n[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_cs_n[0]]
set_property PACKAGE_PIN       H32             [get_ports m2_ddr4_cs_n[0]]   ; #Dimm 3 Active Low Chip Select 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_cs_n[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_cs_n[1]]
set_property PACKAGE_PIN       L29             [get_ports m2_ddr4_cs_n[1]]   ; #Dimm 3 Active Low Chip Select 1
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[0]]
set_property PACKAGE_PIN       A38             [get_ports m2_ddr4_dq[0]]     ; #Dimm 3 Data pin 0
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[1]]
set_property PACKAGE_PIN       A37             [get_ports m2_ddr4_dq[1]]     ; #Dimm 3 Data pin 1
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[2]]
set_property PACKAGE_PIN       B37             [get_ports m2_ddr4_dq[2]]     ; #Dimm 3 Data pin 2
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[3]]
set_property PACKAGE_PIN       C36             [get_ports m2_ddr4_dq[3]]     ; #Dimm 3 Data pin 3
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[4]]
set_property PACKAGE_PIN       C39             [get_ports m2_ddr4_dq[4]]     ; #Dimm 3 Data pin 4
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[5]]
set_property PACKAGE_PIN       D39             [get_ports m2_ddr4_dq[5]]     ; #Dimm 3 Data pin 5
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[6]]
set_property PACKAGE_PIN       B40             [get_ports m2_ddr4_dq[7]]     ; #Dimm 3 Data pin 7
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[8]]
set_property PACKAGE_PIN       D38             [get_ports m2_ddr4_dq[8]]     ; #Dimm 3 Data pin 8
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[9]]
set_property PACKAGE_PIN       E38             [get_ports m2_ddr4_dq[9]]     ; #Dimm 3 Data pin 9
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[10]]
set_property PACKAGE_PIN       E35             [get_ports m2_ddr4_dq[10]]    ; #Dimm 3 Data pin 10
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[11]]
set_property PACKAGE_PIN       F35             [get_ports m2_ddr4_dq[11]]    ; #Dimm 3 Data pin 11
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[12]]
set_property PACKAGE_PIN       F38             [get_ports m2_ddr4_dq[12]]    ; #Dimm 3 Data pin 12
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[13]]
set_property PACKAGE_PIN       G38             [get_ports m2_ddr4_dq[13]]    ; #Dimm 3 Data pin 13
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[14]]
set_property PACKAGE_PIN       E37             [get_ports m2_ddr4_dq[14]]    ; #Dimm 3 Data pin 14
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[15]]
set_property PACKAGE_PIN       E36             [get_ports m2_ddr4_dq[15]]    ; #Dimm 3 Data pin 15
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[16]]
set_property PACKAGE_PIN       H37             [get_ports m2_ddr4_dq[16]]    ; #Dimm 3 Data pin 16
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[17]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[17]]
set_property PACKAGE_PIN       J36             [get_ports m2_ddr4_dq[17]]    ; #Dimm 3 Data pin 17
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[18]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[18]]
set_property PACKAGE_PIN       G36             [get_ports m2_ddr4_dq[18]]    ; #Dimm 3 Data pin 18
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[19]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[19]]
set_property PACKAGE_PIN       H36             [get_ports m2_ddr4_dq[19]]    ; #Dimm 3 Data pin 19
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[20]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[20]]
set_property PACKAGE_PIN       G35             [get_ports m2_ddr4_dq[20]]    ; #Dimm 3 Data pin 20
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[21]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[21]]
set_property PACKAGE_PIN       G34             [get_ports m2_ddr4_dq[21]]    ; #Dimm 3 Data pin 21
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[22]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[22]]
set_property PACKAGE_PIN       K38             [get_ports m2_ddr4_dq[22]]    ; #Dimm 3 Data pin 22
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[23]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[23]]
set_property PACKAGE_PIN       K37             [get_ports m2_ddr4_dq[23]]    ; #Dimm 3 Data pin 23
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[24]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[24]]
set_property PACKAGE_PIN       J35             [get_ports m2_ddr4_dq[24]]    ; #Dimm 3 Data pin 24
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[25]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[25]]
set_property PACKAGE_PIN       K35             [get_ports m2_ddr4_dq[25]]    ; #Dimm 3 Data pin 25
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[26]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[26]]
set_property PACKAGE_PIN       K33             [get_ports m2_ddr4_dq[26]]    ; #Dimm 3 Data pin 26
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[27]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[27]]
set_property PACKAGE_PIN       L33             [get_ports m2_ddr4_dq[27]]    ; #Dimm 3 Data pin 27
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[28]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[28]]
set_property PACKAGE_PIN       J34             [get_ports m2_ddr4_dq[28]]    ; #Dimm 3 Data pin 28
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[29]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[29]]
set_property PACKAGE_PIN       J33             [get_ports m2_ddr4_dq[29]]    ; #Dimm 3 Data pin 29
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[30]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[30]]
set_property PACKAGE_PIN       N34             [get_ports m2_ddr4_dq[30]]    ; #Dimm 3 Data pin 30
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[31]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[31]]
set_property PACKAGE_PIN       P34             [get_ports m2_ddr4_dq[31]]    ; #Dimm 3 Data pin 31
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[32]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[32]]
set_property PACKAGE_PIN       B27             [get_ports m2_ddr4_dq[32]]    ; #Dimm 3 Data pin 32
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[33]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[33]]
set_property PACKAGE_PIN       B26             [get_ports m2_ddr4_dq[33]]    ; #Dimm 3 Data pin 33
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[34]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[34]]
set_property PACKAGE_PIN       C26             [get_ports m2_ddr4_dq[34]]    ; #Dimm 3 Data pin 34
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[35]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[35]]
set_property PACKAGE_PIN       D26             [get_ports m2_ddr4_dq[35]]    ; #Dimm 3 Data pin 35
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[36]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[36]]
set_property PACKAGE_PIN       C28             [get_ports m2_ddr4_dq[36]]    ; #Dimm 3 Data pin 36
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[37]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[37]]
set_property PACKAGE_PIN       C27             [get_ports m2_ddr4_dq[37]]    ; #Dimm 3 Data pin 37
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[38]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[38]]
set_property PACKAGE_PIN       A30             [get_ports m2_ddr4_dq[38]]    ; #Dimm 3 Data pin 38
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[39]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[39]]
set_property PACKAGE_PIN       A29             [get_ports m2_ddr4_dq[39]]    ; #Dimm 3 Data pin 39
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[40]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[40]]
set_property PACKAGE_PIN       D28             [get_ports m2_ddr4_dq[40]]    ; #Dimm 3 Data pin 40
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[41]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[41]]
set_property PACKAGE_PIN       E28             [get_ports m2_ddr4_dq[41]]    ; #Dimm 3 Data pin 41
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[42]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[42]]
set_property PACKAGE_PIN       E27             [get_ports m2_ddr4_dq[42]]    ; #Dimm 3 Data pin 42
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[43]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[43]]
set_property PACKAGE_PIN       F27             [get_ports m2_ddr4_dq[43]]    ; #Dimm 3 Data pin 43
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[44]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[44]]
set_property PACKAGE_PIN       F29             [get_ports m2_ddr4_dq[44]]    ; #Dimm 3 Data pin 44
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[45]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[45]]
set_property PACKAGE_PIN       F28             [get_ports m2_ddr4_dq[45]]    ; #Dimm 3 Data pin 45
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[46]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[46]]
set_property PACKAGE_PIN       G27             [get_ports m2_ddr4_dq[46]]    ; #Dimm 3 Data pin 46
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[47]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[47]]
set_property PACKAGE_PIN       G26             [get_ports m2_ddr4_dq[47]]    ; #Dimm 3 Data pin 47
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[48]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[48]]
set_property PACKAGE_PIN       G29             [get_ports m2_ddr4_dq[48]]    ; #Dimm 3 Data pin 48
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[49]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[49]]
set_property PACKAGE_PIN       H29             [get_ports m2_ddr4_dq[49]]    ; #Dimm 3 Data pin 49
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[50]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[50]]
set_property PACKAGE_PIN       H28             [get_ports m2_ddr4_dq[50]]    ; #Dimm 3 Data pin 50
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[51]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[51]]
set_property PACKAGE_PIN       J28             [get_ports m2_ddr4_dq[51]]    ; #Dimm 3 Data pin 51
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[52]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[52]]
set_property PACKAGE_PIN       K27             [get_ports m2_ddr4_dq[52]]    ; #Dimm 3 Data pin 52
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[53]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[53]]
set_property PACKAGE_PIN       L27             [get_ports m2_ddr4_dq[53]]    ; #Dimm 3 Data pin 53
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[54]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[54]]
set_property PACKAGE_PIN       K26             [get_ports m2_ddr4_dq[54]]    ; #Dimm 3 Data pin 54
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[55]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[55]]
set_property PACKAGE_PIN       K25             [get_ports m2_ddr4_dq[55]]    ; #Dimm 3 Data pin 55
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[56]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[56]]
set_property PACKAGE_PIN       L25             [get_ports m2_ddr4_dq[56]]    ; #Dimm 3 Data pin 56
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[57]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[57]]
set_property PACKAGE_PIN       M25             [get_ports m2_ddr4_dq[57]]    ; #Dimm 3 Data pin 57
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[58]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[58]]
set_property PACKAGE_PIN       P25             [get_ports m2_ddr4_dq[58]]    ; #Dimm 3 Data pin 58
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[59]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[59]]
set_property PACKAGE_PIN       R25             [get_ports m2_ddr4_dq[59]]    ; #Dimm 3 Data pin 5
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[60]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[60]]
set_property PACKAGE_PIN       P26             [get_ports m2_ddr4_dq[60]]    ; #Dimm 3 Data pin 60
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[61]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[61]]
set_property PACKAGE_PIN       R26             [get_ports m2_ddr4_dq[61]]    ; #Dimm 3 Data pin 61
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[62]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[62]]
set_property PACKAGE_PIN       N28             [get_ports m2_ddr4_dq[62]]    ; #Dimm 3 Data pin 62
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[63]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[63]]
set_property PACKAGE_PIN       N27             [get_ports m2_ddr4_dq[63]]    ; #Dimm 3 Data pin 63
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[64]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[64]]
set_property PACKAGE_PIN       N29             [get_ports m2_ddr4_dq[64]]    ; #Dimm 3 Data pin 64
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[65]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[65]]
set_property PACKAGE_PIN       P29             [get_ports m2_ddr4_dq[65]]    ; #Dimm 3 Data pin 65
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[66]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[66]]
set_property PACKAGE_PIN       P30             [get_ports m2_ddr4_dq[66]]    ; #Dimm 3 Data pin 66
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[67]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[67]]
set_property PACKAGE_PIN       R30             [get_ports m2_ddr4_dq[67]]    ; #Dimm 3 Data pin 67
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[68]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[68]]
set_property PACKAGE_PIN       N32             [get_ports m2_ddr4_dq[68]]    ; #Dimm 3 Data pin 68
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[69]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[69]]
set_property PACKAGE_PIN       P31             [get_ports m2_ddr4_dq[69]]    ; #Dimm 3 Data pin 69
set_property PACKAGE_PIN       A40             [get_ports m2_ddr4_dq[6]]     ; #Dimm 3 Data pin 6
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[7]]
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[70]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[70]]
set_property PACKAGE_PIN       L32             [get_ports m2_ddr4_dq[70]]    ; #Dimm 3 Data pin 70
set_property IOSTANDARD        POD12_DCI       [get_ports m2_ddr4_dq[71]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dq[71]]
set_property PACKAGE_PIN       M32             [get_ports m2_ddr4_dq[71]]    ; #Dimm 3 Data pin 71
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[0]]
set_property PACKAGE_PIN       A39             [get_ports m2_ddr4_dqs_c[0]]  ; #Dimm 3 Data Strobe 0
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[1]]
set_property PACKAGE_PIN       C38             [get_ports m2_ddr4_dqs_c[1]]  ; #Dimm 3 Data Strobe 1
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[2]]
set_property PACKAGE_PIN       E40             [get_ports m2_ddr4_dqs_c[2]]  ; #Dimm 3 Data Strobe 2
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[3]]
set_property PACKAGE_PIN       F37             [get_ports m2_ddr4_dqs_c[3]]  ; #Dimm 3 Data Strobe 3
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[4]]
set_property PACKAGE_PIN       H38             [get_ports m2_ddr4_dqs_c[4]]  ; #Dimm 3 Data Strobe 4
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[5]]
set_property PACKAGE_PIN       H34             [get_ports m2_ddr4_dqs_c[5]]  ; #Dimm 3 Data Strobe 5
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[6]]
set_property PACKAGE_PIN       L36             [get_ports m2_ddr4_dqs_c[6]]  ; #Dimm 3 Data Strobe
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[7]]
set_property PACKAGE_PIN       L34             [get_ports m2_ddr4_dqs_c[7]]  ; #Dimm 3 Data Strobe 7
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[8]]
set_property PACKAGE_PIN       A28             [get_ports m2_ddr4_dqs_c[8]]  ; #Dimm 3 Data Strobe 8
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[9]]
set_property PACKAGE_PIN       B29             [get_ports m2_ddr4_dqs_c[9]]  ; #Dimm 3 Data Strobe 9
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[10]]
set_property PACKAGE_PIN       D30             [get_ports m2_ddr4_dqs_c[10]]; #Dimm 3 Data Strobe 10
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[11]]
set_property PACKAGE_PIN       H27             [get_ports m2_ddr4_dqs_c[11]]; #Dimm 3 Data Strobe 11
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[12]]
set_property PACKAGE_PIN       J26             [get_ports m2_ddr4_dqs_c[12]]; #Dimm 3 Data Strobe 12
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[13]]
set_property PACKAGE_PIN       L28             [get_ports m2_ddr4_dqs_c[13]]; #Dimm 3 Data Strobe 13
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[14]]
set_property PACKAGE_PIN       M26             [get_ports m2_ddr4_dqs_c[14]]; #Dimm 3 Data Strobe 14
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[15]]
set_property PACKAGE_PIN       P28             [get_ports m2_ddr4_dqs_c[15]]; #Dimm 3 Data Strobe 15
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[16]]
set_property PACKAGE_PIN       M31             [get_ports m2_ddr4_dqs_c[16]]; #Dimm 3 Data Strobe 16
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_c[17]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_c[17]]
set_property PACKAGE_PIN       R31             [get_ports m2_ddr4_dqs_c[17]]; #Dimm 3 Data Strobe 17
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[0]]
set_property PACKAGE_PIN       B39             [get_ports m2_ddr4_dqs_t[0]]  ; #Dimm 3 Data Strobe 0
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[1]]
set_property PACKAGE_PIN       C37             [get_ports m2_ddr4_dqs_t[1]]  ; #Dimm 3 Data Strobe 1
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[2]]
set_property PACKAGE_PIN       E39             [get_ports m2_ddr4_dqs_t[2]]  ; #Dimm 3 Data Strobe 2
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[3]]
set_property PACKAGE_PIN       G37             [get_ports m2_ddr4_dqs_t[3]]  ; #Dimm 3 Data Strobe 3
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[4]]
set_property PACKAGE_PIN       J38             [get_ports m2_ddr4_dqs_t[4]]  ; #Dimm 3 Data Strobe 4
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[5]]
set_property PACKAGE_PIN       H33             [get_ports m2_ddr4_dqs_t[5]]  ; #Dimm 3 Data Strobe 5
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[6]]
set_property PACKAGE_PIN       L35             [get_ports m2_ddr4_dqs_t[6]]  ; #Dimm 3 Data Strobe 6
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[7]]
set_property PACKAGE_PIN       M34             [get_ports m2_ddr4_dqs_t[7]]  ; #Dimm 3 Data Strobe 7
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[8]]
set_property PACKAGE_PIN       A27             [get_ports m2_ddr4_dqs_t[8]]  ; #Dimm 3 Data Strobe 8
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[9]]
set_property PACKAGE_PIN       C29             [get_ports m2_ddr4_dqs_t[9]]  ; #Dimm 3 Data Strobe 9
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[10]]
set_property PACKAGE_PIN       D29             [get_ports m2_ddr4_dqs_t[10]]; #Dimm 3 Data Strobe 10
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[11]]
set_property PACKAGE_PIN       H26             [get_ports m2_ddr4_dqs_t[11]]; #Dimm 3 Data Strobe 11
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[12]]
set_property PACKAGE_PIN       J25             [get_ports m2_ddr4_dqs_t[12]]; #Dimm 3 Data Strobe 12
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[13]]
set_property PACKAGE_PIN       M27             [get_ports m2_ddr4_dqs_t[13]]; #Dimm 3 Data Strobe 13
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[14]]
set_property PACKAGE_PIN       N26             [get_ports m2_ddr4_dqs_t[14]]; #Dimm 3 Data Strobe 14
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[15]]
set_property PACKAGE_PIN       R28             [get_ports m2_ddr4_dqs_t[15]]; #Dimm 3 Data Strobe 15
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[16]]
set_property PACKAGE_PIN       N31             [get_ports m2_ddr4_dqs_t[16]]; #Dimm 3 Data Strobe 16
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m2_ddr4_dqs_t[17]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_dqs_t[17]]
set_property PACKAGE_PIN       T30             [get_ports m2_ddr4_dqs_t[17]]; #Dimm 3 Data Strobe 17
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_odt[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_odt[0]]
set_property PACKAGE_PIN       G32             [get_ports m2_ddr4_odt[0]]    ; #Dimm 3 On Die Termination 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_odt[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_odt[1]]
set_property PACKAGE_PIN       F33             [get_ports m2_ddr4_odt[1]]    ; #Dimm 3 On Die Termination 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m2_ddr4_parity ]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m2_ddr4_parity ]
set_property PACKAGE_PIN       F34             [get_ports m2_ddr4_parity ]    ; #Dimm 3 Parity
set_property IOSTANDARD        LVCMOS12        [get_ports m2_ddr4_reset_n ]
set_property PACKAGE_PIN       M29             [get_ports m2_ddr4_reset_n ]   ; #Dimm 3 Active Low Reset
#RDIMM4
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_act_n ]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_act_n ]
set_property PACKAGE_PIN       L17             [get_ports m3_ddr4_act_n ]     ; #Dimm 4 Activation Command Low
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[0]]
set_property PACKAGE_PIN       D20             [get_ports m3_ddr4_adr[0]]    ; #Dimm 4 Address 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[1]]
set_property PACKAGE_PIN       D19             [get_ports m3_ddr4_adr[1]]    ; #Dimm 4 Address 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[2]]
set_property PACKAGE_PIN       F20             [get_ports m3_ddr4_adr[2]]    ; #Dimm 4 Address 2
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[3]]
set_property PACKAGE_PIN       E20             [get_ports m3_ddr4_adr[3]]    ; #Dimm 4 Address 3
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[4]]
set_property PACKAGE_PIN       E18             [get_ports m3_ddr4_adr[4]]    ; #Dimm 4 Address 4
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[5]]
set_property PACKAGE_PIN       E17             [get_ports m3_ddr4_adr[5]]    ; #Dimm 4 Address 5
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[6]]
set_property PACKAGE_PIN       D21             [get_ports m3_ddr4_adr[6]]    ; #Dimm 4 Address 6
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[7]]
set_property PACKAGE_PIN       B19             [get_ports m3_ddr4_adr[7]]    ; #Dimm 4 Address 7
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[8]]
set_property PACKAGE_PIN       A19             [get_ports m3_ddr4_adr[8]]    ; #Dimm 4 Address 8
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[9]]
set_property PACKAGE_PIN       A18             [get_ports m3_ddr4_adr[9]]    ; #Dimm 4 Address 9
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[10]]
set_property PACKAGE_PIN       A17             [get_ports m3_ddr4_adr[10]]   ; #Dimm 4 Address 10
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[11]]
set_property PACKAGE_PIN       B20             [get_ports m3_ddr4_adr[11]]   ; #Dimm 4 Address 11
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[12]]
set_property PACKAGE_PIN       A20             [get_ports m3_ddr4_adr[12]]   ; #Dimm 4 Address 12
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[13]]
set_property PACKAGE_PIN       C21             [get_ports m3_ddr4_adr[13]]   ; #Dimm 4 Address 13
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[14]]
set_property PACKAGE_PIN       B21             [get_ports m3_ddr4_adr[14]]   ; #Dimm 4 Address 14
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[15]]
set_property PACKAGE_PIN       C19             [get_ports m3_ddr4_adr[15]]   ; #Dimm 4 Address 15
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_adr[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_adr[16]]
set_property PACKAGE_PIN       C18             [get_ports m3_ddr4_adr[16]]   ; #Dimm 4 Address 16
set_property PACKAGE_PIN       D18             [get_ports m3_ddr4_adr[17]]   ; #Dimm 4 Address 17
set_property PACKAGE_PIN       C17             [get_ports m3_ddr4_alert_n ]   ; #Dimm 4 Active Low Alert
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_ba[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_ba[0]]
set_property PACKAGE_PIN       H19             [get_ports m3_ddr4_ba[0]]     ; #Dimm 4 Bank Address 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_ba[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_ba[1]]
set_property PACKAGE_PIN       G19             [get_ports m3_ddr4_ba[1]]     ; #Dimm 4 Bank Address 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_bg[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_bg[0]]
set_property PACKAGE_PIN       J18             [get_ports m3_ddr4_bg[0]]     ; #Dimm 4 Bank Group 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_bg[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_bg[1]]
set_property PACKAGE_PIN       H18             [get_ports m3_ddr4_bg[1]]     ; #Dimm 4 Bank Group 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_c[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_c[0]]
set_property PACKAGE_PIN       K17             [get_ports m3_ddr4_c[0]]      ; #Dimm 4 Active Low Chip Select 2
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_c[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_c[1]]
set_property PACKAGE_PIN       L19             [get_ports m3_ddr4_c[1]]      ; #Dimm 4 Active Low Chip Select 3
set_property PACKAGE_PIN       B17             [get_ports m3_ddr4_c[2]]      ; #Dimm 4 Die Select
set_property PACKAGE_PIN       D25             [get_ports m3_ddr4_c[3]]      ; #Dimm 4 RFU
set_property PACKAGE_PIN       D15             [get_ports m3_ddr4_c[4]]      ; #Dimm 4 RFU
set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports m3_ddr4_ck_c[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_ck_c[0]]
set_property PACKAGE_PIN       F17             [get_ports m3_ddr4_ck_c ]      ; #Dimm 4 Clock
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_cke[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_cke[0]]
set_property PACKAGE_PIN       J19             [get_ports m3_ddr4_cke[0]]    ; #Dimm 4 Clock Enable 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_cke[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_cke[1]]
set_property PACKAGE_PIN       L20             [get_ports m3_ddr4_cke[1]]    ; #Dimm 4 Clock Enable 1
set_property IOSTANDARD        DIFF_SSTL12_DCI [get_ports m3_ddr4_ck_t[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_ck_t[0]]
set_property PACKAGE_PIN       F18             [get_ports m3_ddr4_ck_t ]      ; #Dimm 4 Clock
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_cs_n[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_cs_n[0]]
set_property PACKAGE_PIN       L18             [get_ports m3_ddr4_cs_n[0]]   ; #Dimm 4 Active Low Chip Select 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_cs_n[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_cs_n[1]]
set_property PACKAGE_PIN       J20             [get_ports m3_ddr4_cs_n[1]]   ; #Dimm 4 Active Low Chip Select 1
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[0]]
set_property PACKAGE_PIN       A22             [get_ports m3_ddr4_dq[0]]     ; #Dimm 4 Data Pin 0
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[1]]
set_property PACKAGE_PIN       A23             [get_ports m3_ddr4_dq[1]]     ; #Dimm 4 Data Pin 1
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[2]]
set_property PACKAGE_PIN       B24             [get_ports m3_ddr4_dq[2]]     ; #Dimm 4 Data Pin 2
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[3]]
set_property PACKAGE_PIN       B25             [get_ports m3_ddr4_dq[3]]     ; #Dimm 4 Data Pin 3
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[4]]
set_property PACKAGE_PIN       C23             [get_ports m3_ddr4_dq[4]]     ; #Dimm 4 Data Pin 4
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[5]]
set_property PACKAGE_PIN       C24             [get_ports m3_ddr4_dq[5]]     ; #Dimm 4 Data Pin 5
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[6]]
set_property PACKAGE_PIN       B22             [get_ports m3_ddr4_dq[6]]     ; #Dimm 4 Data Pin 6
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[7]]
set_property PACKAGE_PIN       C22             [get_ports m3_ddr4_dq[7]]     ; #Dimm 4 Data Pin 7
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[8]]
set_property PACKAGE_PIN       G21             [get_ports m3_ddr4_dq[8]]     ; #Dimm 4 Data Pin 8
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[9]]
set_property PACKAGE_PIN       G22             [get_ports m3_ddr4_dq[9]]     ; #Dimm 4 Data Pin 9
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[10]]
set_property PACKAGE_PIN       E22             [get_ports m3_ddr4_dq[10]]    ; #Dimm 4 Data Pin 10
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[11]]
set_property PACKAGE_PIN       F22             [get_ports m3_ddr4_dq[11]]    ; #Dimm 4 Data Pin 11
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[12]]
set_property PACKAGE_PIN       E25             [get_ports m3_ddr4_dq[12]]    ; #Dimm 4 Data Pin 12
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[13]]
set_property PACKAGE_PIN       F25             [get_ports m3_ddr4_dq[13]]    ; #Dimm 4 Data Pin 13
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[14]]
set_property PACKAGE_PIN       F24             [get_ports m3_ddr4_dq[14]]    ; #Dimm 4 Data Pin 14
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[15]]
set_property PACKAGE_PIN       G25             [get_ports m3_ddr4_dq[15]]    ; #Dimm 4 Data Pin 15
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[16]]
set_property PACKAGE_PIN       G24             [get_ports m3_ddr4_dq[16]]    ; #Dimm 4 Data Pin 16
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[17]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[17]]
set_property PACKAGE_PIN       H24             [get_ports m3_ddr4_dq[17]]    ; #Dimm 4 Data Pin 17
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[18]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[18]]
set_property PACKAGE_PIN       J23             [get_ports m3_ddr4_dq[18]]    ; #Dimm 4 Data Pin 18
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[19]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[19]]
set_property PACKAGE_PIN       J24             [get_ports m3_ddr4_dq[19]]    ; #Dimm 4 Data Pin 19
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[20]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[20]]
set_property PACKAGE_PIN       L23             [get_ports m3_ddr4_dq[20]]    ; #Dimm 4 Data Pin 20
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[21]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[21]]
set_property PACKAGE_PIN       L24             [get_ports m3_ddr4_dq[21]]    ; #Dimm 4 Data Pin 21
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[22]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[22]]
set_property PACKAGE_PIN       K21             [get_ports m3_ddr4_dq[22]]    ; #Dimm 4 Data Pin 22
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[23]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[23]]
set_property PACKAGE_PIN       K22             [get_ports m3_ddr4_dq[23]]    ; #Dimm 4 Data Pin 23
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[24]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[24]]
set_property PACKAGE_PIN       R23             [get_ports m3_ddr4_dq[24]]    ; #Dimm 4 Data Pin 24
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[25]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[25]]
set_property PACKAGE_PIN       T24             [get_ports m3_ddr4_dq[25]]    ; #Dimm 4 Data Pin 25
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[26]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[26]]
set_property PACKAGE_PIN       N24             [get_ports m3_ddr4_dq[26]]    ; #Dimm 4 Data Pin 26
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[27]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[27]]
set_property PACKAGE_PIN       P24             [get_ports m3_ddr4_dq[27]]    ; #Dimm 4 Data Pin 27
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[28]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[28]]
set_property PACKAGE_PIN       N23             [get_ports m3_ddr4_dq[28]]    ; #Dimm 4 Data Pin 28
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[29]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[29]]
set_property PACKAGE_PIN       P23             [get_ports m3_ddr4_dq[29]]    ; #Dimm 4 Data Pin 29
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[30]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[30]]
set_property PACKAGE_PIN       P21             [get_ports m3_ddr4_dq[30]]    ; #Dimm 4 Data Pin 30
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[31]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[31]]
set_property PACKAGE_PIN       R21             [get_ports m3_ddr4_dq[31]]    ; #Dimm 4 Data Pin 31
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[32]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[32]]
set_property PACKAGE_PIN       A13             [get_ports m3_ddr4_dq[32]]    ; #Dimm 4 Data Pin 32
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[33]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[33]]
set_property PACKAGE_PIN       B13             [get_ports m3_ddr4_dq[33]]    ; #Dimm 4 Data Pin 33
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[34]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[34]]
set_property PACKAGE_PIN       B16             [get_ports m3_ddr4_dq[34]]    ; #Dimm 4 Data Pin 34
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[35]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[35]]
set_property PACKAGE_PIN       C16             [get_ports m3_ddr4_dq[35]]    ; #Dimm 4 Data Pin 35
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[36]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[36]]
set_property PACKAGE_PIN       A15             [get_ports m3_ddr4_dq[36]]    ; #Dimm 4 Data Pin 36
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[37]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[37]]
set_property PACKAGE_PIN       B15             [get_ports m3_ddr4_dq[37]]    ; #Dimm 4 Data Pin 37
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[38]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[38]]
set_property PACKAGE_PIN       C14             [get_ports m3_ddr4_dq[38]]    ; #Dimm 4 Data Pin 38
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[39]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[39]]
set_property PACKAGE_PIN       D14             [get_ports m3_ddr4_dq[39]]    ; #Dimm 4 Data Pin 39
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[40]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[40]]
set_property PACKAGE_PIN       F14             [get_ports m3_ddr4_dq[40]]    ; #Dimm 4 Data Pin 40
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[41]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[41]]
set_property PACKAGE_PIN       F15             [get_ports m3_ddr4_dq[41]]    ; #Dimm 4 Data Pin 41
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[42]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[42]]
set_property PACKAGE_PIN       E15             [get_ports m3_ddr4_dq[42]]    ; #Dimm 4 Data Pin 42
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[43]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[43]]
set_property PACKAGE_PIN       E16             [get_ports m3_ddr4_dq[43]]    ; #Dimm 4 Data Pin 43
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[44]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[44]]
set_property PACKAGE_PIN       E13             [get_ports m3_ddr4_dq[44]]    ; #Dimm 4 Data Pin 44
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[45]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[45]]
set_property PACKAGE_PIN       F13             [get_ports m3_ddr4_dq[45]]    ; #Dimm 4 Data Pin 45
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[46]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[46]]
set_property PACKAGE_PIN       H13             [get_ports m3_ddr4_dq[46]]    ; #Dimm 4 Data Pin 46
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[47]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[47]]
set_property PACKAGE_PIN       H14             [get_ports m3_ddr4_dq[47]]    ; #Dimm 4 Data Pin 47
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[48]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[48]]
set_property PACKAGE_PIN       J13             [get_ports m3_ddr4_dq[48]]    ; #Dimm 4 Data Pin 48
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[49]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[49]]
set_property PACKAGE_PIN       J14             [get_ports m3_ddr4_dq[49]]    ; #Dimm 4 Data Pin 49
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[50]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[50]]
set_property PACKAGE_PIN       G15             [get_ports m3_ddr4_dq[50]]    ; #Dimm 4 Data Pin 50
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[51]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[51]]
set_property PACKAGE_PIN       G16             [get_ports m3_ddr4_dq[51]]    ; #Dimm 4 Data Pin 51
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[52]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[52]]
set_property PACKAGE_PIN       J15             [get_ports m3_ddr4_dq[52]]    ; #Dimm 4 Data Pin 52
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[53]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[53]]
set_property PACKAGE_PIN       K16             [get_ports m3_ddr4_dq[53]]    ; #Dimm 4 Data Pin 53
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[54]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[54]]
set_property PACKAGE_PIN       M13             [get_ports m3_ddr4_dq[54]]    ; #Dimm 4 Data Pin 54
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[55]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[55]]
set_property PACKAGE_PIN       M14             [get_ports m3_ddr4_dq[55]]    ; #Dimm 4 Data Pin 55
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[56]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[56]]
set_property PACKAGE_PIN       M16             [get_ports m3_ddr4_dq[56]]    ; #Dimm 4 Data Pin 56
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[57]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[57]]
set_property PACKAGE_PIN       N16             [get_ports m3_ddr4_dq[57]]    ; #Dimm 4 Data Pin 57
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[58]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[58]]
set_property PACKAGE_PIN       N13             [get_ports m3_ddr4_dq[58]]    ; #Dimm 4 Data Pin 58
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[59]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[59]]
set_property PACKAGE_PIN       N14             [get_ports m3_ddr4_dq[59]]    ; #Dimm 4 Data Pin 59
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[60]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[60]]
set_property PACKAGE_PIN       P13             [get_ports m3_ddr4_dq[60]]    ; #Dimm 4 Data Pin 60
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[61]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[61]]
set_property PACKAGE_PIN       P14             [get_ports m3_ddr4_dq[61]]    ; #Dimm 4 Data Pin 61
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[62]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[62]]
set_property PACKAGE_PIN       R15             [get_ports m3_ddr4_dq[62]]    ; #Dimm 4 Data Pin 62
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[63]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[63]]
set_property PACKAGE_PIN       T15             [get_ports m3_ddr4_dq[63]]    ; #Dimm 4 Data Pin 63
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[64]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[64]]
set_property PACKAGE_PIN       R17             [get_ports m3_ddr4_dq[64]]    ; #Dimm 4 Data Pin 64
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[65]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[65]]
set_property PACKAGE_PIN       R18             [get_ports m3_ddr4_dq[65]]    ; #Dimm 4 Data Pin 65
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[66]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[66]]
set_property PACKAGE_PIN       M19             [get_ports m3_ddr4_dq[66]]    ; #Dimm 4 Data Pin 66
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[67]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[67]]
set_property PACKAGE_PIN       M20             [get_ports m3_ddr4_dq[67]]    ; #Dimm 4 Data Pin 67
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[68]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[68]]
set_property PACKAGE_PIN       N18             [get_ports m3_ddr4_dq[68]]    ; #Dimm 4 Data Pin 68
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[69]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[69]]
set_property PACKAGE_PIN       N19             [get_ports m3_ddr4_dq[69]]    ; #Dimm 4 Data Pin 69
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[70]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[70]]
set_property PACKAGE_PIN       R20             [get_ports m3_ddr4_dq[70]]    ; #Dimm 4 Data Pin 70
set_property IOSTANDARD        POD12_DCI       [get_ports m3_ddr4_dq[71]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dq[71]]
set_property PACKAGE_PIN       T20             [get_ports m3_ddr4_dq[71]]    ; #Dimm 4 Data Pin 71
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[0]]
set_property PACKAGE_PIN       A24             [get_ports m3_ddr4_dqs_c[0]]  ; #Dimm 4 Data Strobe 0
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[1]]
set_property PACKAGE_PIN       D23             [get_ports m3_ddr4_dqs_c[1]]  ; #Dimm 4 Data Strobe 1
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[2]]
set_property PACKAGE_PIN       E23             [get_ports m3_ddr4_dqs_c[2]]  ; #Dimm 4 Data Strobe 2
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[3]]
set_property PACKAGE_PIN       H22             [get_ports m3_ddr4_dqs_c[3]]  ; #Dimm 4 Data Strobe 3
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[4]]
set_property PACKAGE_PIN       H21             [get_ports m3_ddr4_dqs_c[4]]  ; #Dimm 4 Data Strobe 4
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[5]]
set_property PACKAGE_PIN       L22             [get_ports m3_ddr4_dqs_c[5]]  ; #Dimm 4 Data Strobe 5
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[6]]
set_property PACKAGE_PIN       R22             [get_ports m3_ddr4_dqs_c[6]]  ; #Dimm 4 Data Strobe 6
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[7]]
set_property PACKAGE_PIN       N21             [get_ports m3_ddr4_dqs_c[7]]  ; #Dimm 4 Data Strobe 7
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[8]]
set_property PACKAGE_PIN       C13             [get_ports m3_ddr4_dqs_c[8]]  ; #Dimm 4 Data Strobe 8
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[9]]
set_property PACKAGE_PIN       A14             [get_ports m3_ddr4_dqs_c[9]]  ; #Dimm 4 Data Strobe 9
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[10]]
set_property PACKAGE_PIN       G13             [get_ports m3_ddr4_dqs_c[10]]; #Dimm 4 Data Strobe 10
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[11]]
set_property PACKAGE_PIN       H16             [get_ports m3_ddr4_dqs_c[11]]; #Dimm 4 Data Strobe 11
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[12]]
set_property PACKAGE_PIN       L13             [get_ports m3_ddr4_dqs_c[12]]; #Dimm 4 Data Strobe 12
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[13]]
set_property PACKAGE_PIN       K15             [get_ports m3_ddr4_dqs_c[13]]; #Dimm 4 Data Strobe 13
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[14]]
set_property PACKAGE_PIN       P15             [get_ports m3_ddr4_dqs_c[14]]; #Dimm 4 Data Strobe 14
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[15]]
set_property PACKAGE_PIN       R13             [get_ports m3_ddr4_dqs_c[15]]; #Dimm 4 Data Strobe 15
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[16]]
set_property PACKAGE_PIN       P18             [get_ports m3_ddr4_dqs_c[16]]; #Dimm 4 Data Strobe 16
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_c[17]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_c[17]]
set_property PACKAGE_PIN       M17             [get_ports m3_ddr4_dqs_c[17]]; #Dimm 4 Data Strobe 17
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[0]]
set_property PACKAGE_PIN       A25             [get_ports m3_ddr4_dqs_t[0]]  ; #Dimm 4 Data Strobe 0
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[1]]
set_property PACKAGE_PIN       D24             [get_ports m3_ddr4_dqs_t[1]]  ; #Dimm 4 Data Strobe 1
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[2]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[2]]
set_property PACKAGE_PIN       F23             [get_ports m3_ddr4_dqs_t[2]]  ; #Dimm 4 Data Strobe 2
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[3]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[3]]
set_property PACKAGE_PIN       H23             [get_ports m3_ddr4_dqs_t[3]]  ; #Dimm 4 Data Strobe 3
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[4]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[4]]
set_property PACKAGE_PIN       J21             [get_ports m3_ddr4_dqs_t[4]]  ; #Dimm 4 Data Strobe 4
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[5]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[5]]
set_property PACKAGE_PIN       M22             [get_ports m3_ddr4_dqs_t[5]]  ; #Dimm 4 Data Strobe 5
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[6]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[6]]
set_property PACKAGE_PIN       T22             [get_ports m3_ddr4_dqs_t[6]]  ; #Dimm 4 Data Strobe 6
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[7]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[7]]
set_property PACKAGE_PIN       N22             [get_ports m3_ddr4_dqs_t[7]]  ; #Dimm 4 Data Strobe 7
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[8]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[8]]
set_property PACKAGE_PIN       D13             [get_ports m3_ddr4_dqs_t[8]]  ; #Dimm 4 Data Strobe 8
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[9]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[9]]
set_property PACKAGE_PIN       B14             [get_ports m3_ddr4_dqs_t[9]]  ; #Dimm 4 Data Strobe 9
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[10]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[10]]
set_property PACKAGE_PIN       G14             [get_ports m3_ddr4_dqs_t[10]]; #Dimm 4 Data Strobe 10
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[11]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[11]]
set_property PACKAGE_PIN       J16             [get_ports m3_ddr4_dqs_t[11]]; #Dimm 4 Data Strobe 11
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[12]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[12]]
set_property PACKAGE_PIN       L14             [get_ports m3_ddr4_dqs_t[12]]; #Dimm 4 Data Strobe 12
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[13]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[13]]
set_property PACKAGE_PIN       L15             [get_ports m3_ddr4_dqs_t[13]]; #Dimm 4 Data Strobe 13
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[14]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[14]]
set_property PACKAGE_PIN       R16             [get_ports m3_ddr4_dqs_t[14]]; #Dimm 4 Data Strobe 14
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[15]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[15]]
set_property PACKAGE_PIN       T13             [get_ports m3_ddr4_dqs_t[15]]; #Dimm 4 Data Strobe 15
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[16]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[16]]
set_property PACKAGE_PIN       P19             [get_ports m3_ddr4_dqs_t[16]]; #Dimm 4 Data Strobe 16
set_property IOSTANDARD        DIFF_POD12_DCI  [get_ports m3_ddr4_dqs_t[17]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_dqs_t[17]]
set_property PACKAGE_PIN       N17             [get_ports m3_ddr4_dqs_t[17]]; #Dimm 4 Data Strobe 17
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_odt[0]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_odt[0]]
set_property PACKAGE_PIN       K20             [get_ports m3_ddr4_odt[0]]    ; #Dimm 4 On Die Termination 0
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_odt[1]]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_odt[1]]
set_property PACKAGE_PIN       H17             [get_ports m3_ddr4_odt[1]]    ; #Dimm 4 On Die Termination 1
set_property IOSTANDARD        SSTL12_DCI      [get_ports m3_ddr4_parity ]
set_property OUTPUT_IMPEDANCE  RDRV_40_40      [get_ports m3_ddr4_parity ]
set_property PACKAGE_PIN       G17             [get_ports m3_ddr4_parity ]    ; #Dimm 4 Parity
set_property IOSTANDARD        LVCMOS12        [get_ports m3_ddr4_reset_n ]
set_property PACKAGE_PIN       K18             [get_ports m3_ddr4_reset_n ]   ; #Dimm 4 Active Low Reset
##################################################
##########   GTY QSFP Reference Clocks; #########
##################################################
# NOTE: Period constraint represents 322.265625 MHz reference clock - Modify as necessary

set_property PACKAGE_PIN AL36 [get_ports gty_refclk0p_i[0]]; # GTY Bank 120 Refclk 0 / SI5346A CLK 3
set_property PACKAGE_PIN AL37 [get_ports gty_refclk0n_i[0]]
create_clock -name gtrefclk0_0 -period 3.104 [get_ports gty_refclk0p_i[0]]

set_property PACKAGE_PIN AJ36 [get_ports gty_refclk0p_i[1]]; # GTY Bank 121 Refclk 0 / SI5346A CLK 2
set_property PACKAGE_PIN AJ37 [get_ports gty_refclk0n_i[1]]
create_clock -name gtrefclk0_1 -period 3.104 [get_ports gty_refclk0p_i[1]]

set_property PACKAGE_PIN AG36 [get_ports gty_refclk0p_i[2]]; # GTY Bank 122 Refclk 0 / SI5346B CLK 3
set_property PACKAGE_PIN AG37 [get_ports gty_refclk0n_i[2]]
create_clock -name gtrefclk0_2 -period 3.104 [get_ports gty_refclk0p_i[2]]

set_property PACKAGE_PIN AE36 [get_ports gty_refclk0p_i[3]]; # GTY Bank 123 Refclk 0 / SI5346B CLK 2
set_property PACKAGE_PIN AE37 [get_ports gty_refclk0n_i[3]]
create_clock -name gtrefclk0_3 -period 3.104 [get_ports gty_refclk0p_i[3]]

set_property PACKAGE_PIN AC36 [get_ports gty_refclk0p_i[4]]; # GTY Bank 128 Refclk 0 / SI5346A CLK 1
set_property PACKAGE_PIN AC37 [get_ports gty_refclk0n_i[4]]
create_clock -name gtrefclk0_8 -period 3.104 [get_ports gty_refclk0p_i[4]]

set_property PACKAGE_PIN AA36 [get_ports gty_refclk0p_i[5]]; # GTY Bank 129 Refclk 0 / SI5346A CLK 0
set_property PACKAGE_PIN AA37 [get_ports gty_refclk0n_i[5]]
create_clock -name gtrefclk0_9 -period 3.104 [get_ports gty_refclk0p_i[5]]

set_property PACKAGE_PIN U36 [get_ports gty_refclk0p_i[6]]; # GTY Bank 131 Refclk 0 / SI5346B CLK 1
set_property PACKAGE_PIN U37 [get_ports gty_refclk0n_i[6]]
create_clock -name gtrefclk0_11 -period 3.104 [get_ports gty_refclk0p_i[6]]

set_property PACKAGE_PIN R36 [get_ports gty_refclk0p_i[7]]; # GTY Bank 133 Refclk 0 / SI5346B CLK 0
set_property PACKAGE_PIN R37 [get_ports gty_refclk0n_i[7]]
create_clock -name gtrefclk0_13 -period 3.104 [get_ports gty_refclk0p_i[7]]

##################################################
##########   GTY QSFP Output Clocks    ; ##########
##################################################
set_property IOSTANDARD LVDS [get_ports gty_outclk0p_i[0]]; # GTY Bank 120 Clk 1 / SI5346A Input 1
set_property PACKAGE_PIN AK34 [get_ports gty_outclk0p_i[0]
set_property IOSTANDARD LVDS [get_ports gty_outclk0n_i[0]]
set_property PACKAGE_PIN AK35 [get_ports gty_outclk0n_i[0]]

set_property IOSTANDARD LVDS [get_ports gty_outclk0p_i[1]]; # GTY Bank 122 Clk 1 / SI5346B Input 1
set_property PACKAGE_PIN AF34 [get_ports gty_outclk0p_i[1]]
set_property IOSTANDARD LVDS [get_ports gty_outclk0n_i[1]]
set_property PACKAGE_PIN AF35 [get_ports gty_outclk0n_i[1]]

##################################################
##########   GTY QSFP Connector Pins   ; ##########
##################################################
# NOTE: All GTY pins are automatically assigned by Vivado. Shown here for reference only.
#GTY Bank 120 QSFPDD-1 3:0
set_property package_pin BC46 [get_ports gty_rxn_i[0]]; # QSFP1_RX_N_0 QSFP Port 0 Input Pin 0
set_property package_pin BC45 [get_ports gty_rxp_i[0]]; # QSFP1_RX_P_0 QSFP Port 0 Input Pin 0
set_property package_pin BA46 [get_ports gty_rxn_i[1]]; # QSFP1_RX_N_1 QSFP Port 0 Input Pin 1
set_property package_pin BA45 [get_ports gty_rxp_i[1]]; # QSFP1_RX_P_1 QSFP Port 0 Input Pin 1
set_property package_pin AW46 [get_ports gty_rxn_i[2]]; # QSFP1_RX_N_2 QSFP Port 0 Input Pin 2
set_property package_pin AW45 [get_ports gty_rxp_i[2]]; # QSFP1_RX_P_2 QSFP Port 0 Input Pin 2
set_property package_pin AV44 [get_ports gty_rxn_i[3]]; # QSFP1_RX_N_3 QSFP Port 0 Input Pin 3
set_property package_pin AV43 [get_ports gty_rxp_i[3]]; # QSFP1_RX_P_3 QSFP Port 0 Input Pin 3
set_property package_pin BD43 [get_ports gty_txn_o[0]]; # QSFP1_TX_N_0 QSFP Port 0 Output Pin 0
set_property package_pin BD42 [get_ports gty_txp_o[0]]; # QSFP1_TX_P_0 QSFP Port 0 Output Pin 0
set_property package_pin BB43 [get_ports gty_txn_o[1]]; # QSFP1_TX_N_1 QSFP Port 0 Output Pin 1
set_property package_pin BB42 [get_ports gty_txp_o[1]]; # QSFP1_TX_P_1 QSFP Port 0 Output Pin 1
set_property package_pin AY43 [get_ports gty_txn_o[2]]; # QSFP1_TX_N_2 QSFP Port 0 Output Pin 2
set_property package_pin AY42 [get_ports gty_txp_o[2]]; # QSFP1_TX_P_2 QSFP Port 0 Output Pin 2
set_property package_pin AW41 [get_ports gty_txn_o[3]]; # QSFP1_TX_N_3 QSFP Port 0 Output Pin 3
set_property package_pin AW40 [get_ports gty_txp_o[3]]; # QSFP1_TX_P_3 QSFP Port 0 Output Pin 3

#GTY Bank 121 QSFPDD-1 7:4
set_property package_pin AU46 [get_ports gty_rxn_i[4]]; # QSFP1_RX_N_4 QSFP Port 0 Input Pin 4
set_property package_pin AU45 [get_ports gty_rxp_i[4]]; # QSFP1_RX_P_4 QSFP Port 0 Input Pin 4
set_property package_pin AT44 [get_ports gty_rxn_i[5]]; # QSFP1_RX_N_5 QSFP Port 0 Input Pin 5
set_property package_pin AT43 [get_ports gty_rxp_i[5]]; # QSFP1_RX_P_5 QSFP Port 0 Input Pin 5
set_property package_pin AR46 [get_ports gty_rxn_i[6]]; # QSFP1_RX_N_6 QSFP Port 0 Input Pin 6
set_property package_pin AR45 [get_ports gty_rxp_i[6]]; # QSFP1_RX_P_6 QSFP Port 0 Input Pin 6
set_property package_pin AP44 [get_ports gty_rxn_i[7]]; # QSFP1_RX_N_7 QSFP Port 0 Input Pin 7
set_property package_pin AP43 [get_ports gty_rxp_i[7]]; # QSFP1_RX_P_7 QSFP Port 0 Input Pin 7
set_property package_pin AU41 [get_ports gty_txn_o[4]]; # QSFP1_TX_N_4 QSFP Port 0 Output Pin 4
set_property package_pin AU40 [get_ports gty_txp_o[4]]; # QSFP1_TX_P_4 QSFP Port 0 Output Pin 4
set_property package_pin AT39 [get_ports gty_txn_o[5]]; # QSFP1_TX_N_5 QSFP Port 0 Output Pin 5
set_property package_pin AT38 [get_ports gty_txp_o[5]]; # QSFP1_TX_P_5 QSFP Port 0 Output Pin 5
set_property package_pin AR41 [get_ports gty_txn_o[6]]; # QSFP1_TX_N_6 QSFP Port 0 Output Pin 6
set_property package_pin AR40 [get_ports gty_txp_o[6]]; # QSFP1_TX_P_6 QSFP Port 0 Output Pin 6
set_property package_pin AP39 [get_ports gty_txn_o[7]]; # QSFP1_TX_N_7 QSFP Port 0 Output Pin 7
set_property package_pin AP38 [get_ports gty_txp_o[7]]; # QSFP1_TX_P_7 QSFP Port 0 Output Pin 7

#GTY Bank 122 QSFPDD-2 3:0
set_property package_pin AN46 [get_ports gty_rxn_i[8]]; # QSFP2_RX_N_0 QSFP Port 1 Input Pin 0
set_property package_pin AN45 [get_ports gty_rxp_i[8]]; # QSFP2_RX_P_0 QSFP Port 1 Input Pin 0
set_property package_pin AM44 [get_ports gty_rxn_i[9]]; # QSFP2_RX_N_1 QSFP Port 1 Input Pin 1
set_property package_pin AM43 [get_ports gty_rxp_i[9]]; # QSFP2_RX_P_1 QSFP Port 1 Input Pin 1
set_property package_pin AL46 [get_ports gty_rxn_i[10]]; # QSFP2_RX_N_2 QSFP Port 1 Input Pin 2
set_property package_pin AL45 [get_ports gty_rxp_i[10]]; # QSFP2_RX_P_2 QSFP Port 1 Input Pin 2
set_property package_pin AK44 [get_ports gty_rxn_i[11]]; # QSFP2_RX_N_3 QSFP Port 1 Input Pin 3
set_property package_pin AK43 [get_ports gty_rxp_i[11]]; # QSFP2_RX_P_3 QSFP Port 1 Input Pin 3
set_property package_pin AN41 [get_ports gty_txn_o[8]]; # QSFP2_TX_N_0 QSFP Port 1 Output Pin 0
set_property package_pin AN40 [get_ports gty_txp_o[8]]; # QSFP2_TX_P_0 QSFP Port 1 Output Pin 0
set_property package_pin AM39 [get_ports gty_txn_o[9]]; # QSFP2_TX_N_1 QSFP Port 1 Output Pin 1
set_property package_pin AM38 [get_ports gty_txp_o[9]]; # QSFP2_TX_P_1 QSFP Port 1 Output Pin 1
set_property package_pin AL41 [get_ports gty_txn_o[10]]; # QSFP2_TX_N_2 QSFP Port 1 Output Pin 2
set_property package_pin AL40 [get_ports gty_txp_o[10]]; # QSFP2_TX_P_2 QSFP Port 1 Output Pin 2
set_property package_pin AK39 [get_ports gty_txn_o[11]]; # QSFP2_TX_N_3 QSFP Port 1 Output Pin 3
set_property package_pin AK38 [get_ports gty_txp_o[11]]; # QSFP2_TX_P_3 QSFP Port 1 Output Pin 3

#GTY Bank 123 QSFPDD-2 7:4
set_property package_pin AJ46 [get_ports gty_rxn_i[12]]; # QSFP2_RX_N_4 QSFP Port 1 Input Pin 4
set_property package_pin AJ45 [get_ports gty_rxp_i[12]]; # QSFP2_RX_P_4 QSFP Port 1 Input Pin 4
set_property package_pin AH44 [get_ports gty_rxn_i[13]]; # QSFP2_RX_N_5 QSFP Port 1 Input Pin 5
set_property package_pin AH43 [get_ports gty_rxp_i[13]]; # QSFP2_RX_P_5 QSFP Port 1 Input Pin 5
set_property package_pin AG46 [get_ports gty_rxn_i[14]]; # QSFP2_RX_N_6 QSFP Port 1 Input Pin 6
set_property package_pin AG45 [get_ports gty_rxp_i[14]]; # QSFP2_RX_P_6 QSFP Port 1 Input Pin 6
set_property package_pin AF44 [get_ports gty_rxn_i[15]]; # QSFP2_RX_N_7 QSFP Port 1 Input Pin 7
set_property package_pin AF43 [get_ports gty_rxp_i[15]]; # QSFP2_RX_P_7 QSFP Port 1 Input Pin 7
set_property package_pin AJ41 [get_ports gty_txn_o[12]]; # QSFP2_TX_N_4 QSFP Port 1 Output Pin 4
set_property package_pin AJ40 [get_ports gty_txp_o[12]]; # QSFP2_TX_P_4 QSFP Port 1 Output Pin 4
set_property package_pin AH39 [get_ports gty_txn_o[13]]; # QSFP2_TX_N_5 QSFP Port 1 Output Pin 5
set_property package_pin AH38 [get_ports gty_txp_o[13]]; # QSFP2_TX_P_5 QSFP Port 1 Output Pin 5
set_property package_pin AG41 [get_ports gty_txn_o[14]]; # QSFP2_TX_N_6 QSFP Port 1 Output Pin 6
set_property package_pin AG40 [get_ports gty_txp_o[14]]; # QSFP2_TX_P_6 QSFP Port 1 Output Pin 6
set_property package_pin AF39 [get_ports gty_txn_o[15]]; # QSFP2_TX_N_7 QSFP Port 1 Output Pin 7
set_property package_pin AF38 [get_ports gty_txp_o[15]]; # QSFP2_TX_P_7 QSFP Port 1 Output Pin 7

#GTY Bank 128 QSFPDD-3 3:0
set_property package_pin AE46 [get_ports gty_rxn_i[16]]; # QSFP3_RX_N_0 QSFP Port 2 Input Pin 0
set_property package_pin AE45 [get_ports gty_rxp_i[16]]; # QSFP3_RX_P_0 QSFP Port 2 Input Pin 0
set_property package_pin AD44 [get_ports gty_rxn_i[17]]; # QSFP3_RX_N_1 QSFP Port 2 Input Pin 1
set_property package_pin AD43 [get_ports gty_rxp_i[17]]; # QSFP3_RX_P_1 QSFP Port 2 Input Pin 1
set_property package_pin AC46 [get_ports gty_rxn_i[18]]; # QSFP3_RX_N_2 QSFP Port 2 Input Pin 2
set_property package_pin AC45 [get_ports gty_rxp_i[18]]; # QSFP3_RX_P_2 QSFP Port 2 Input Pin 2
set_property package_pin AB44 [get_ports gty_rxn_i[19]]; # QSFP3_RX_N_3 QSFP Port 2 Input Pin 3
set_property package_pin AB43 [get_ports gty_rxp_i[19]]; # QSFP3_RX_P_3 QSFP Port 2 Input Pin 3
set_property package_pin AE41 [get_ports gty_txn_o[16]]; # QSFP3_TX_N_0 QSFP Port 2 Output Pin 0
set_property package_pin AE40 [get_ports gty_txp_o[16]]; # QSFP3_TX_P_0 QSFP Port 2 Output Pin 0
set_property package_pin AD39 [get_ports gty_txn_o[17]]; # QSFP3_TX_N_1 QSFP Port 2 Output Pin 1
set_property package_pin AD38 [get_ports gty_txp_o[17]]; # QSFP3_TX_P_1 QSFP Port 2 Output Pin 1
set_property package_pin AC41 [get_ports gty_txn_o[18]]; # QSFP3_TX_N_2 QSFP Port 2 Output Pin 2
set_property package_pin AC40 [get_ports gty_txp_o[18]]; # QSFP3_TX_P_2 QSFP Port 2 Output Pin 2
set_property package_pin AB39 [get_ports gty_txn_o[19]]; # QSFP3_TX_N_3 QSFP Port 2 Output Pin 3
set_property package_pin AB38 [get_ports gty_txp_o[19]]; # QSFP3_TX_P_3 QSFP Port 2 Output Pin 3

#GTY Bank 129 QSFPDD-3 7:4
set_property package_pin AA46 [get_ports gty_rxn_i[20]]; # QSFP3_RX_N_4 QSFP Port 2 Input Pin 4
set_property package_pin AA45 [get_ports gty_rxp_i[20]]; # QSFP3_RX_P_4 QSFP Port 2 Input Pin 4
set_property package_pin Y44 [get_ports gty_rxn_i[21]]; # QSFP3_RX_N_5 QSFP Port 2 Input Pin 5
set_property package_pin Y43 [get_ports gty_rxp_i[21]]; # QSFP3_RX_P_5 QSFP Port 2 Input Pin 5
set_property package_pin W46 [get_ports gty_rxn_i[22]]; # QSFP3_RX_N_6 QSFP Port 2 Input Pin 6
set_property package_pin W45 [get_ports gty_rxp_i[22]]; # QSFP3_RX_P_6 QSFP Port 2 Input Pin 6
set_property package_pin V44 [get_ports gty_rxn_i[23]]; # QSFP3_RX_N_7 QSFP Port 2 Input Pin 7
set_property package_pin V43 [get_ports gty_rxp_i[23]]; # QSFP3_RX_P_7 QSFP Port 2 Input Pin 7
set_property package_pin AA41 [get_ports gty_txn_o[20]]; # QSFP3_TX_N_4 QSFP Port 2 Output Pin 4
set_property package_pin AA40 [get_ports gty_txp_o[20]]; # QSFP3_TX_P_4 QSFP Port 2 Output Pin 4
set_property package_pin Y39 [get_ports gty_txn_o[21]]; # QSFP3_TX_N_5 QSFP Port 2 Output Pin 5
set_property package_pin Y38 [get_ports gty_txp_o[21]]; # QSFP3_TX_P_5 QSFP Port 2 Output Pin 5
set_property package_pin W41 [get_ports gty_txn_o[22]]; # QSFP3_TX_N_6 QSFP Port 2 Output Pin 6
set_property package_pin W40 [get_ports gty_txp_o[22]]; # QSFP3_TX_P_6 QSFP Port 2 Output Pin 6
set_property package_pin V39 [get_ports gty_txn_o[23]]; # QSFP3_TX_N_7 QSFP Port 2 Output Pin 7
set_property package_pin V38 [get_ports gty_txp_o[23]]; # QSFP3_TX_P_7 QSFP Port 2 Output Pin 7

#GTY Bank 131 QSFPDD-4 3:0
set_property package_pin N46 [get_ports gty_rxn_i[24]]; # QSFP4_RX_N_0 QSFP Port 3 Input Pin 0
set_property package_pin N45 [get_ports gty_rxp_i[24]]; # QSFP4_RX_P_0 QSFP Port 3 Input Pin 0
set_property package_pin M44 [get_ports gty_rxn_i[25]]; # QSFP4_RX_N_1 QSFP Port 3 Input Pin 1
set_property package_pin M43 [get_ports gty_rxp_i[25]]; # QSFP4_RX_P_1 QSFP Port 3 Input Pin 1
set_property package_pin L46 [get_ports gty_rxn_i[26]]; # QSFP4_RX_N_2 QSFP Port 3 Input Pin 2
set_property package_pin L45 [get_ports gty_rxp_i[26]]; # QSFP4_RX_P_2 QSFP Port 3 Input Pin 2
set_property package_pin K44 [get_ports gty_rxn_i[27]]; # QSFP4_RX_N_3 QSFP Port 3 Input Pin 3
set_property package_pin K43 [get_ports gty_rxp_i[27]]; # QSFP4_RX_P_3 QSFP Port 3 Input Pin 3
set_property package_pin N41 [get_ports gty_txn_o[24]]; # QSFP4_TX_N_0 QSFP Port 3 Output Pin 0
set_property package_pin N40 [get_ports gty_txp_o[24]]; # QSFP4_TX_P_0 QSFP Port 3 Output Pin 0
set_property package_pin M39 [get_ports gty_txn_o[25]]; # QSFP4_TX_N_1 QSFP Port 3 Output Pin 1
set_property package_pin M38 [get_ports gty_txp_o[25]]; # QSFP4_TX_P_1 QSFP Port 3 Output Pin 1
set_property package_pin L41 [get_ports gty_txn_o[26]]; # QSFP4_TX_N_2 QSFP Port 3 Output Pin 2
set_property package_pin L40 [get_ports gty_txp_o[26]]; # QSFP4_TX_P_2 QSFP Port 3 Output Pin 2
set_property package_pin J41 [get_ports gty_txn_o[27]]; # QSFP4_TX_N_3 QSFP Port 3 Output Pin 3
set_property package_pin J40 [get_ports gty_txp_o[27]]; # QSFP4_TX_P_3 QSFP Port 3 Output Pin 3

#GTY Bank 133 QSFPDD-4 7:4
set_property package_pin J46 [get_ports gty_rxn_i[28]]; # QSFP4_RX_N_4 QSFP Port 3 Input Pin 4
set_property package_pin J45 [get_ports gty_rxp_i[28]]; # QSFP4_RX_P_4 QSFP Port 3 Input Pin 4
set_property package_pin H44 [get_ports gty_rxn_i[29]]; # QSFP4_RX_N_5 QSFP Port 3 Input Pin 5
set_property package_pin H43 [get_ports gty_rxp_i[29]]; # QSFP4_RX_P_5 QSFP Port 3 Input Pin 5
set_property package_pin F46 [get_ports gty_rxn_i[30]]; # QSFP4_RX_N_6 QSFP Port 3 Input Pin 6
set_property package_pin F45 [get_ports gty_rxp_i[30]]; # QSFP4_RX_P_6 QSFP Port 3 Input Pin 6
set_property package_pin D46 [get_ports gty_rxn_i[31]]; # QSFP4_RX_N_7 QSFP Port 3 Input Pin 7
set_property package_pin D45 [get_ports gty_rxp_i[31]]; # QSFP4_RX_P_7 QSFP Port 3 Input Pin 7
set_property package_pin G41 [get_ports gty_txn_o[28]]; # QSFP4_TX_N_4 QSFP Port 3 Output Pin 4
set_property package_pin G40 [get_ports gty_txp_o[28]]; # QSFP4_TX_P_4 QSFP Port 3 Output Pin 4
set_property package_pin E43 [get_ports gty_txn_o[29]]; # QSFP4_TX_N_5 QSFP Port 3 Output Pin 5
set_property package_pin E42 [get_ports gty_txp_o[29]]; # QSFP4_TX_P_5 QSFP Port 3 Output Pin 5
set_property package_pin C43 [get_ports gty_txn_o[30]]; # QSFP4_TX_N_6 QSFP Port 3 Output Pin 6
set_property package_pin C42 [get_ports gty_txp_o[30]]; # QSFP4_TX_P_6 QSFP Port 3 Output Pin 6
set_property package_pin A43 [get_ports gty_txn_o[31]]; # QSFP4_TX_N_7 QSFP Port 3 Output Pin 7
set_property package_pin A42 [get_ports gty_txp_o[31]]; # QSFP4_TX_P_7 QSFP Port 3 Output Pin 7

##################################################
########## GTY Oculink Reference Clocks; ##########
##################################################
# NOTE: Clock periods below assume a 100 MHz clock, please adjust as necessary based on your application

set_property PACKAGE_PIN M11 [get_ports gty_ocu_refclk0p_i[0]]; # GTY Bank 231 OCU 1 OSC 0
set_property PACKAGE_PIN M10 [get_ports gty_ocu_refclk0n_i[0]]
create_clock -name gtrefclk0_25 -period 10 [get_ports gty_ocu_refclk0p_i[0]]

set_property PACKAGE_PIN H11 [get_ports gty_ocu_refclk1p_i[0]]; # GTY Bank 232 OCU 2 CLK 0
set_property PACKAGE_PIN H10 [get_ports gty_ocu_refclk1n_i[0]]
create_clock -name gtrefclk0_26 -period 10 [get_ports gty_ocu_refclk1p_i[0]]

##################################################
##########        GTY Oculink Pins     ; ##########
##################################################
# NOTE: All GTY pins are automatically assigned by Vivado. Shown here for reference only.

#GTY BANK 231 OCU 1 3:0
set_property package_pin N3 [get_ports gty_ocu_rxn_i[0]]; # OCU1_RXN_0 Oculink 1 Input Pin 0
set_property package_pin N4 [get_ports gty_ocu_rxp_i[0]]; # OCU1_RXP_0
set_property package_pin M1 [get_ports gty_ocu_rxn_i[1]]; # OCU1_RXN_1 Oculink 1 Input Pin 1
set_property package_pin M2 [get_ports gty_ocu_rxp_i[1]]; # OCU1_RXP_1
set_property package_pin L3 [get_ports gty_ocu_rxn_i[2]]; # OCU1_RXN_2 Oculink 1 Input Pin 2
set_property package_pin L4 [get_ports gty_ocu_rxp_i[2]]; # OCU1_RXP_2
set_property package_pin K1 [get_ports gty_ocu_rxn_i[3]]; # OCU1_RXN_3 Oculink 1 Input Pin 3
set_property package_pin K2 [get_ports gty_ocu_rxp_i[3]]; # OCU1_RXP_3
set_property package_pin N8 [get_ports gty_ocu_txn_o[0]]; # OCU1_TXN_0 Oculink 1 Output Pin 0
set_property package_pin N9 [get_ports gty_ocu_txp_o[0]]; # OCU1_TXP_0
set_property package_pin M6 [get_ports gty_ocu_txn_o[1]]; # OCU1_TXN_1 Oculink 1 Output Pin 1
set_property package_pin M7 [get_ports gty_ocu_txp_o[1]]; # OCU1_TXP_1
set_property package_pin L8 [get_ports gty_ocu_txn_o[2]]; # OCU1_TXN_2 Oculink 1 Output Pin 2
set_property package_pin L9 [get_ports gty_ocu_txp_o[2]]; # OCU1_TXP_2
set_property package_pin K6 [get_ports gty_ocu_txn_o[3]]; # OCU1_TXN_3 Oculink 1 Output Pin 3
set_property package_pin K7 [get_ports gty_ocu_txp_o[3]]; # OCU1_TXP_3

#GTY BANK 232 OCU 2 3:0
set_property package_pin J3 [get_ports gty_ocu_rxn_i[4]]; # OCU2_RXN_0 Oculink 2 Input Pin 0
set_property package_pin J4 [get_ports gty_ocu_rxp_i[4]]; # OCU2_RXP_0
set_property package_pin H1 [get_ports gty_ocu_rxn_i[5]]; # OCU2_RXN_1 Oculink 2 Input Pin 1
set_property package_pin H2 [get_ports gty_ocu_rxp_i[5]]; # OCU2_RXP_1
set_property package_pin G3 [get_ports gty_ocu_rxn_i[6]]; # OCU2_RXN_2 Oculink 2 Input Pin 2
set_property package_pin G4 [get_ports gty_ocu_rxp_i[6]]; # OCU2_RXP_2
set_property package_pin F1 [get_ports gty_ocu_rxn_i[7]]; # OCU2_RXN_3 Oculink 2 Input Pin 3
set_property package_pin F2 [get_ports gty_ocu_rxp_i[7]]; # OCU2_RXP_3
set_property package_pin J8 [get_ports gty_ocu_txn_o[4]]; # OCU2_TXN_0 Oculink 2 Output Pin 0
set_property package_pin J9 [get_ports gty_ocu_txp_o[4]]; # OCU2_TXP_0
set_property package_pin H6 [get_ports gty_ocu_txn_o[5]]; # OCU2_TXN_1 Oculink 2 Output Pin 1
set_property package_pin H7 [get_ports gty_ocu_txp_o[5]]; # OCU2_TXP_1
set_property package_pin G8 [get_ports gty_ocu_txn_o[6]]; # OCU2_TXN_2 Oculink 2 Output Pin 2
set_property package_pin G9 [get_ports gty_ocu_txp_o[6]]; # OCU2_TXP_2
set_property package_pin F6 [get_ports gty_ocu_txn_o[7]]; # OCU2_TXN_3 Oculink 2 Output Pin 3
set_property package_pin F7 [get_ports gty_ocu_txp_o[7]]; # OCU2_TXP_3
