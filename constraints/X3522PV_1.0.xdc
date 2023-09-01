############################################################################
##   Copyright 2022 Xilinx Inc.
##
##   Licensed under the Apache License, Version 2.0 (the "License");
##   you may not use this file except in compliance with the License.
##   You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
##   Unless required by applicable law or agreed to in writing, software
##   distributed under the License is distributed on an "AS IS" BASIS,
##   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##   See the License for the specific language governing permissions and
##   limitations under the License.
############################################################################
#
#
#   X3522pv - Master XDC
#   Revision: 1.00 (09/16/2022)

# This XDC contains the necessary pinout, clock, and configuration information to get started on a design.
# Please see the card UG for more information on board components including part numbers, I2C bus details, clock and power trees.

#
# Bitstream generation
# Configuration
# ------------------------------------------------------------------------------
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable    [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE           [current_design]
set_property CONFIG_MODE SPIx4                         [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN disable [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 85.0          [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup         [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes       [current_design]


#################################################################################
#
# I2C Address Table
#
#################################################################################
#
#     I2C Bus, Device, Description                   Slave Address
#                                                    7-Bit   8-bit
# -----------------------------------                -----   -----
# Power PMBUS_SCL/SCA  —  Accessible from Server BMC or SC only                                   
#     Renesas ISL68220IRAZ                           0x60    0xC0 
#                                                            
# System I2C_MAIN_SCL/SDA  — Accessible from the SC only                                 
#     EEPROM (OnSemi CAV24C256WE)                    0x50    0xA0 
#     Temp Diode (TI TMP411CDGKT)                    0x4E    0x9C 
#     Temp Sense Left (NXP LM75BTP)                  0x48    0x90 
#     Temp Sense Right (NXP LM75BTP)                 0x49    0x92 
#     Current Sensor (INA3221)                       0x40    0x80
#     Clock Generator (SiT9514AI)                    0x69    0xD2 

#################################################################################
#
# Clocks
#
#################################################################################
#  100MHz PCIe Reference Clock
set_property PACKAGE_PIN AL10              [get_ports "PEX_REFCLK_C_P"]        ;# Bank 225 - MGTREFCLK0P_225 
set_property PACKAGE_PIN AL9               [get_ports "PEX_REFCLK_C_N"]        ;# Bank 225 - MGTREFCLK0N_225 

#  100MHz Reference Clock
set_property PACKAGE_PIN AK8               [get_ports "CLK0_LVDS_100_P"]       ;# Bank 225 - MGTREFCLK1P_225 
set_property PACKAGE_PIN AK7               [get_ports "CLK0_LVDS_100_N"]       ;# Bank 225 - MGTREFCLK1N_225 

# 161.1328125 MHz Clock
set_property PACKAGE_PIN P9                [get_ports "CLK1_LVDS_161_P"]       ;# Bank 231 - MGTREFCLK0P_231 
set_property PACKAGE_PIN P8                [get_ports "CLK1_LVDS_161_N"]       ;# Bank 231 - MGTREFCLK0N_231 

#  300MHz DDR4 Clock 
set_property PACKAGE_PIN AN27              [get_ports "CLK2_LVDS_300_P"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L13P_T2L_N0_GC_QBC_66_AN27
set_property IOSTANDARD LVDS               [get_ports "CLK2_LVDS_300_P"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L13P_T2L_N0_GC_QBC_66_AN27
set_property PACKAGE_PIN AN28              [get_ports "CLK2_LVDS_300_N"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L13N_T2L_N1_GC_QBC_66_AN28
set_property IOSTANDARD LVDS               [get_ports "CLK2_LVDS_300_N"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L13N_T2L_N1_GC_QBC_66_AN28


#  300MHz User Clock
set_property PACKAGE_PIN AL23              [get_ports "CLK3_LVDS_300_N"]       ;#  Bank  65 VCCO - +1V8_SYS - IO_L11N_T1U_N9_GC_A11_D27_65_AL23
set_property IOSTANDARD LVDS               [get_ports "CLK3_LVDS_300_N"]       ;#  Bank  65 VCCO - +1V8_SYS - IO_L11N_T1U_N9_GC_A11_D27_65_AL23
set_property PACKAGE_PIN AK23              [get_ports "CLK3_LVDS_300_P"]       ;#  Bank  65 VCCO - +1V8_SYS - IO_L11P_T1U_N8_GC_A10_D26_65_AK23
set_property IOSTANDARD LVDS               [get_ports "CLK3_LVDS_300_P"]       ;#  Bank  65 VCCO - +1V8_SYS - IO_L11P_T1U_N8_GC_A10_D26_65_AK23



#################################################################################
#
#  PCIe Interface X8, G3
#
#################################################################################

#    PCIE_PERST_LS_65    - Active low input from PCIe Connector to Ultrascale+ Device to detect presence
#    PEX_PWRBRKN_FPGA_65 - Active low input from PCIe Connector Signaling PCIe card to shut down card power in Server failing condition.
set_property PACKAGE_PIN AK18              [get_ports "PCIE_PERST_LS_65"]      ;#  Bank  65 VCCO - +1V8_SYS - IO_T3U_N12_PERSTN0_65_AK18
set_property IOSTANDARD LVCMOS18           [get_ports "PCIE_PERST_LS_65"]      ;#  Bank  65 VCCO - +1V8_SYS - IO_T3U_N12_PERSTN0_65_AK18
set_property PACKAGE_PIN AM20              [get_ports "PEX_PWRBRKN_FPGA_65"]   ;#  Bank  65 VCCO - +1V8_SYS - IO_L17N_T2U_N9_AD10N_D15_65_AM20
set_property IOSTANDARD LVCMOS18           [get_ports "PEX_PWRBRKN_FPGA_65"]   ;#  Bank  65 VCCO - +1V8_SYS - IO_L17N_T2U_N9_AD10N_D15_65_AM20

#  PCIe Data Connections - Bank 224 and Bank 225 (1.2V)
#    Typical GT pin constraints are embedded in the IP
#
set_property PACKAGE_PIN AR22              [get_ports "PEX_TX_P[7]"]           ;# Bank 224 - MGTYTXP0_224 
set_property PACKAGE_PIN AR21              [get_ports "PEX_TX_N[7]"]           ;# Bank 224 - MGTYTXN0_224 
set_property PACKAGE_PIN AU22              [get_ports "PEX_RX_P[7]"]           ;# Bank 224 - MGTYRXP0_224 
set_property PACKAGE_PIN AU21              [get_ports "PEX_RX_N[7]"]           ;# Bank 224 - MGTYRXN0_224 
set_property PACKAGE_PIN AT20              [get_ports "PEX_TX_P[6]"]           ;# Bank 224 - MGTYTXP1_224 
set_property PACKAGE_PIN AT19              [get_ports "PEX_TX_N[6]"]           ;# Bank 224 - MGTYTXN1_224 
set_property PACKAGE_PIN AU18              [get_ports "PEX_RX_P[6]"]           ;# Bank 224 - MGTYRXP1_224 
set_property PACKAGE_PIN AU17              [get_ports "PEX_RX_N[6]"]           ;# Bank 224 - MGTYRXN1_224 
set_property PACKAGE_PIN AR18              [get_ports "PEX_TX_P[5]"]           ;# Bank 224 - MGTYTXP2_224 
set_property PACKAGE_PIN AR17              [get_ports "PEX_TX_N[5]"]           ;# Bank 224 - MGTYTXN2_224 
set_property PACKAGE_PIN AT16              [get_ports "PEX_RX_P[5]"]           ;# Bank 224 - MGTYRXP2_224 
set_property PACKAGE_PIN AT15              [get_ports "PEX_RX_N[5]"]           ;# Bank 224 - MGTYRXN2_224 
set_property PACKAGE_PIN AR14              [get_ports "PEX_TX_P[4]"]           ;# Bank 224 - MGTYTXP3_224 
set_property PACKAGE_PIN AR13              [get_ports "PEX_TX_N[4]"]           ;# Bank 224 - MGTYTXN3_224 
set_property PACKAGE_PIN AU14              [get_ports "PEX_RX_P[4]"]           ;# Bank 224 - MGTYRXP3_224 
set_property PACKAGE_PIN AU13              [get_ports "PEX_RX_N[4]"]           ;# Bank 224 - MGTYRXN3_224 

set_property PACKAGE_PIN AT12              [get_ports "PEX_TX_P[3]"]           ;# Bank 225 - MGTYTXP0_225 
set_property PACKAGE_PIN AT11              [get_ports "PEX_TX_N[3]"]           ;# Bank 225 - MGTYTXN0_225 
set_property PACKAGE_PIN AU10              [get_ports "PEX_RX_P[3]"]           ;# Bank 225 - MGTYRXP0_225 
set_property PACKAGE_PIN AU9               [get_ports "PEX_RX_N[3]"]           ;# Bank 225 - MGTYRXN0_225 
set_property PACKAGE_PIN AR10              [get_ports "PEX_TX_P[2]"]           ;# Bank 225 - MGTYTXP1_225 
set_property PACKAGE_PIN AR9               [get_ports "PEX_TX_N[2]"]           ;# Bank 225 - MGTYTXN1_225 
set_property PACKAGE_PIN AT8               [get_ports "PEX_RX_P[2]"]           ;# Bank 225 - MGTYRXP1_225 
set_property PACKAGE_PIN AT7               [get_ports "PEX_RX_N[2]"]           ;# Bank 225 - MGTYRXN1_225 
set_property PACKAGE_PIN AR6               [get_ports "PEX_TX_P[1]"]           ;# Bank 225 - MGTYTXP2_225 
set_property PACKAGE_PIN AR5               [get_ports "PEX_TX_N[1]"]           ;# Bank 225 - MGTYTXN2_225 
set_property PACKAGE_PIN AU6               [get_ports "PEX_RX_P[1]"]           ;# Bank 225 - MGTYRXP2_225 
set_property PACKAGE_PIN AU5               [get_ports "PEX_RX_N[1]"]           ;# Bank 225 - MGTYRXN2_225 
set_property PACKAGE_PIN AP8               [get_ports "PEX_TX_P[0]"]           ;# Bank 225 - MGTYTXP3_225 
set_property PACKAGE_PIN AP7               [get_ports "PEX_TX_N[0]"]           ;# Bank 225 - MGTYTXN3_225 
set_property PACKAGE_PIN AT4               [get_ports "PEX_RX_P[0]"]           ;# Bank 225 - MGTYRXP3_225 
set_property PACKAGE_PIN AT3               [get_ports "PEX_RX_N[0]"]           ;# Bank 225 - MGTYRXN3_225 

#################################################################################
#
#  DDR4 Interface
#
#################################################################################

#
#  DDR4 Active High Output from Ultrascale+ Device to hold all External DDR4 interfaces in Self refresh.
#                  This output disconnects the memory interface reset and holds it in active and pulls the clock enables signal on the memory interfaces.
#
set_property PACKAGE_PIN AN18              [get_ports "DDR4_C0_RESET_GATE"]    ;#  Bank  65 VCCO - +1V8_SYS
set_property IOSTANDARD LVCMOS18           [get_ports "DDR4_C0_RESET_GATE"]    ;#  Bank  65 VCCO - +1V8_SYS

#
#  DDR4 RDIMM Controller 0, 72-bit Data Interface, x5  Components, Single Rank
#     Banks 66, 67, 68 (1.2V)
#     Part Number MT40A1G16KD-062E
#
set_property PACKAGE_PIN AM30              [get_ports "c0_ddr4_a[0]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L2P_T0L_N2_66_AM30
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[0]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L2P_T0L_N2_66_AM30
set_property PACKAGE_PIN AR31              [get_ports "c0_ddr4_a[1]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L5P_T0U_N8_AD14P_66_AR31
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[1]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L5P_T0U_N8_AD14P_66_AR31
set_property PACKAGE_PIN AN29              [get_ports "c0_ddr4_a[10]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L3P_T0L_N4_AD15P_66_AN29
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[10]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L3P_T0L_N4_AD15P_66_AN29
set_property PACKAGE_PIN AR28              [get_ports "c0_ddr4_a[11]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L8P_T1L_N2_AD5P_66_AR28
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[11]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L8P_T1L_N2_AD5P_66_AR28
set_property PACKAGE_PIN AP30              [get_ports "c0_ddr4_a[12]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L4N_T0U_N7_DBC_AD7N_66_AP30
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[12]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L4N_T0U_N7_DBC_AD7N_66_AP30
set_property PACKAGE_PIN AU25              [get_ports "c0_ddr4_a[13]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_T1U_N12_66_AU25
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[13]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_T1U_N12_66_AU25
set_property PACKAGE_PIN AP29              [get_ports "c0_ddr4_a[2]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L4P_T0U_N6_DBC_AD7P_66_AP29
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[2]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L4P_T0U_N6_DBC_AD7P_66_AP29
set_property PACKAGE_PIN AT30              [get_ports "c0_ddr4_a[3]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L6N_T0U_N11_AD6N_66_AT30
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[3]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L6N_T0U_N11_AD6N_66_AT30
set_property PACKAGE_PIN AL30              [get_ports "c0_ddr4_a[4]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L1P_T0L_N0_DBC_66_AL30
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[4]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L1P_T0L_N0_DBC_66_AL30
set_property PACKAGE_PIN AT26              [get_ports "c0_ddr4_a[5]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L10P_T1U_N6_QBC_AD4P_66_AT26
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[5]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L10P_T1U_N6_QBC_AD4P_66_AT26
set_property PACKAGE_PIN AL31              [get_ports "c0_ddr4_a[6]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L1N_T0L_N1_DBC_66_AL31
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[6]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L1N_T0L_N1_DBC_66_AL31
set_property PACKAGE_PIN AU26              [get_ports "c0_ddr4_a[7]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L10N_T1U_N7_QBC_AD4N_66_AU26
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[7]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L10N_T1U_N7_QBC_AD4N_66_AU26
set_property PACKAGE_PIN AT28              [get_ports "c0_ddr4_a[8]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L8N_T1L_N3_AD5N_66_AT28
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[8]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L8N_T1L_N3_AD5N_66_AT28
set_property PACKAGE_PIN AR29              [get_ports "c0_ddr4_a[9]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L6P_T0U_N10_AD6P_66_AR29
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_a[9]"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L6P_T0U_N10_AD6P_66_AR29
set_property PACKAGE_PIN AM27              [get_ports "c0_ddr4_act_b"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L15N_T2L_N5_AD11N_66_AM27
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_act_b"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L15N_T2L_N5_AD11N_66_AM27
set_property PACKAGE_PIN AT31              [get_ports "c0_ddr4_alert_b"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L5N_T0U_N9_AD14N_66_AT31
set_property IOSTANDARD LVCMOS12           [get_ports "c0_ddr4_alert_b"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L5N_T0U_N9_AD14N_66_AT31
set_property DRIVE 8                       [get_ports "c0_ddr4_alert_b"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L5N_T0U_N9_AD14N_66_AT31
#was
#set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_alert_b"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L5N_T0U_N9_AD14N_66_AT31
set_property PACKAGE_PIN AN30              [get_ports "c0_ddr4_ba[0]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L3N_T0L_N5_AD15N_66_AN30
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_ba[0]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L3N_T0L_N5_AD15N_66_AN30
set_property PACKAGE_PIN AU27              [get_ports "c0_ddr4_ba[1]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L9P_T1L_N4_AD12P_66_AU27
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_ba[1]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L9P_T1L_N4_AD12P_66_AU27
set_property PACKAGE_PIN AK26              [get_ports "c0_ddr4_bg[0]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L16P_T2U_N6_QBC_AD3P_66_AK26
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_bg[0]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L16P_T2U_N6_QBC_AD3P_66_AK26
set_property PACKAGE_PIN AR27              [get_ports "c0_ddr4_cas_b"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L11N_T1U_N9_GC_66_AR27
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_cas_b"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L11N_T1U_N9_GC_66_AR27
set_property PACKAGE_PIN AU30              [get_ports "c0_ddr4_ck_c[0]"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L7N_T1L_N1_QBC_AD13N_66_AU30
set_property IOSTANDARD DIFF_SSTL12_DCI    [get_ports "c0_ddr4_ck_c[0]"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L7N_T1L_N1_QBC_AD13N_66_AU30
set_property PACKAGE_PIN AT29              [get_ports "c0_ddr4_ck_t[0]"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L7P_T1L_N0_QBC_AD13P_66_AT29
set_property IOSTANDARD DIFF_SSTL12_DCI    [get_ports "c0_ddr4_ck_t[0]"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L7P_T1L_N0_QBC_AD13P_66_AT29
set_property PACKAGE_PIN AL26              [get_ports "c0_ddr4_cke[0]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L16N_T2U_N7_QBC_AD3N_66_AL26
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_cke[0]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L16N_T2U_N7_QBC_AD3N_66_AL26
set_property PACKAGE_PIN AM31              [get_ports "c0_ddr4_cs_n[0]"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L2N_T0L_N3_66_AM31
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_cs_n[0]"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L2N_T0L_N3_66_AM31
set_property PACKAGE_PIN AN37              [get_ports "c0_ddr4_dm_b[0]"]       ;#  Bank  67 VCCO - 1V2_VCCO - IO_L7P_T1L_N0_QBC_AD13P_67_AN37
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dm_b[0]"]       ;#  Bank  67 VCCO - 1V2_VCCO - IO_L7P_T1L_N0_QBC_AD13P_67_AN37
set_property PACKAGE_PIN AK29              [get_ports "c0_ddr4_dm_b[1]"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L19P_T3L_N0_DBC_AD9P_66_AK29
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dm_b[1]"]       ;#  Bank  66 VCCO - 1V2_VCCO - IO_L19P_T3L_N0_DBC_AD9P_66_AK29
set_property PACKAGE_PIN Y33               [get_ports "c0_ddr4_dm_b[2]"]       ;#  Bank  68 VCCO - 1V2_VCCO - IO_L19P_T3L_N0_DBC_AD9P_68_Y33
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dm_b[2]"]       ;#  Bank  68 VCCO - 1V2_VCCO - IO_L19P_T3L_N0_DBC_AD9P_68_Y33
set_property PACKAGE_PIN AB36              [get_ports "c0_ddr4_dm_b[3]"]       ;#  Bank  68 VCCO - 1V2_VCCO - IO_L1P_T0L_N0_DBC_68_AB36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dm_b[3]"]       ;#  Bank  68 VCCO - 1V2_VCCO - IO_L1P_T0L_N0_DBC_68_AB36
set_property PACKAGE_PIN AM36              [get_ports "c0_ddr4_dm_b[4]"]       ;#  Bank  67 VCCO - 1V2_VCCO - IO_L13P_T2L_N0_GC_QBC_67_AM36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dm_b[4]"]       ;#  Bank  67 VCCO - 1V2_VCCO - IO_L13P_T2L_N0_GC_QBC_67_AM36
set_property PACKAGE_PIN AH37              [get_ports "c0_ddr4_dm_b[5]"]       ;#  Bank  67 VCCO - 1V2_VCCO - IO_L19P_T3L_N0_DBC_AD9P_67_AH37
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dm_b[5]"]       ;#  Bank  67 VCCO - 1V2_VCCO - IO_L19P_T3L_N0_DBC_AD9P_67_AH37
set_property PACKAGE_PIN AC37              [get_ports "c0_ddr4_dm_b[6]"]       ;#  Bank  68 VCCO - 1V2_VCCO - IO_L7P_T1L_N0_QBC_AD13P_68_AC37
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dm_b[6]"]       ;#  Bank  68 VCCO - 1V2_VCCO - IO_L7P_T1L_N0_QBC_AD13P_68_AC37
set_property PACKAGE_PIN AE32              [get_ports "c0_ddr4_dm_b[7]"]       ;#  Bank  68 VCCO - 1V2_VCCO - IO_L13P_T2L_N0_GC_QBC_68_AE32
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dm_b[7]"]       ;#  Bank  68 VCCO - 1V2_VCCO - IO_L13P_T2L_N0_GC_QBC_68_AE32
set_property PACKAGE_PIN AU31              [get_ports "c0_ddr4_dm_b[8]"]       ;#  Bank  67 VCCO - 1V2_VCCO - IO_L1P_T0L_N0_DBC_67_AU31
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dm_b[8]"]       ;#  Bank  67 VCCO - 1V2_VCCO - IO_L1P_T0L_N0_DBC_67_AU31
set_property PACKAGE_PIN AM35              [get_ports "c0_ddr4_dq[0]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L12P_T1U_N10_GC_67_AM35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[0]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L12P_T1U_N10_GC_67_AM35
set_property PACKAGE_PIN AP34              [get_ports "c0_ddr4_dq[1]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L9N_T1L_N5_AD12N_67_AP34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[1]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L9N_T1L_N5_AD12N_67_AP34
set_property PACKAGE_PIN AJ31              [get_ports "c0_ddr4_dq[10]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L20N_T3L_N3_AD1N_66_AJ31
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[10]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L20N_T3L_N3_AD1N_66_AJ31
set_property PACKAGE_PIN AG31              [get_ports "c0_ddr4_dq[11]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L24N_T3U_N11_66_AG31
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[11]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L24N_T3U_N11_66_AG31
set_property PACKAGE_PIN AH29              [get_ports "c0_ddr4_dq[12]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L21P_T3L_N4_AD8P_66_AH29
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[12]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L21P_T3L_N4_AD8P_66_AH29
set_property PACKAGE_PIN AF30              [get_ports "c0_ddr4_dq[13]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L23N_T3U_N9_66_AF30
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[13]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L23N_T3U_N9_66_AF30
set_property PACKAGE_PIN AJ30              [get_ports "c0_ddr4_dq[14]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L20P_T3L_N2_AD1P_66_AJ30
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[14]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L20P_T3L_N2_AD1P_66_AJ30
set_property PACKAGE_PIN AF29              [get_ports "c0_ddr4_dq[15]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L23P_T3U_N8_66_AF29
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[15]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L23P_T3U_N8_66_AF29
set_property PACKAGE_PIN AB32              [get_ports "c0_ddr4_dq[16]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L21N_T3L_N5_AD8N_68_AB32
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[16]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L21N_T3L_N5_AD8N_68_AB32
set_property PACKAGE_PIN Y32               [get_ports "c0_ddr4_dq[17]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L20N_T3L_N3_AD1N_68_Y32
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[17]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L20N_T3L_N3_AD1N_68_Y32
set_property PACKAGE_PIN W32               [get_ports "c0_ddr4_dq[18]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L20P_T3L_N2_AD1P_68_W32
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[18]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L20P_T3L_N2_AD1P_68_W32
set_property PACKAGE_PIN W31               [get_ports "c0_ddr4_dq[19]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L23N_T3U_N9_68_W31
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[19]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L23N_T3U_N9_68_W31
set_property PACKAGE_PIN AN33              [get_ports "c0_ddr4_dq[2]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L9P_T1L_N4_AD12P_67_AN33
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[2]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L9P_T1L_N4_AD12P_67_AN33
set_property PACKAGE_PIN AB31              [get_ports "c0_ddr4_dq[20]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L21P_T3L_N4_AD8P_68_AB31
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[20]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L21P_T3L_N4_AD8P_68_AB31
set_property PACKAGE_PIN W30               [get_ports "c0_ddr4_dq[21]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L23P_T3U_N8_68_W30
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[21]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L23P_T3U_N8_68_W30
set_property PACKAGE_PIN AA29              [get_ports "c0_ddr4_dq[22]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L24N_T3U_N11_68_AA29
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[22]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L24N_T3U_N11_68_AA29
set_property PACKAGE_PIN Y29               [get_ports "c0_ddr4_dq[23]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L24P_T3U_N10_68_Y29
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[23]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L24P_T3U_N10_68_Y29
set_property PACKAGE_PIN Y34               [get_ports "c0_ddr4_dq[24]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L5P_T0U_N8_AD14P_68_Y34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[24]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L5P_T0U_N8_AD14P_68_Y34
set_property PACKAGE_PIN AA35              [get_ports "c0_ddr4_dq[25]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L5N_T0U_N9_AD14N_68_AA35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[25]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L5N_T0U_N9_AD14N_68_AA35
set_property PACKAGE_PIN W36               [get_ports "c0_ddr4_dq[26]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L3P_T0L_N4_AD15P_68_W36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[26]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L3P_T0L_N4_AD15P_68_W36
set_property PACKAGE_PIN AA34              [get_ports "c0_ddr4_dq[27]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L6P_T0U_N10_AD6P_68_AA34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[27]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L6P_T0U_N10_AD6P_68_AA34
set_property PACKAGE_PIN AA36              [get_ports "c0_ddr4_dq[28]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L2N_T0L_N3_68_AA36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[28]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L2N_T0L_N3_68_AA36
set_property PACKAGE_PIN W37               [get_ports "c0_ddr4_dq[29]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L3N_T0L_N5_AD15N_68_W37
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[29]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L3N_T0L_N5_AD15N_68_W37
set_property PACKAGE_PIN AN34              [get_ports "c0_ddr4_dq[3]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L11N_T1U_N9_GC_67_AN34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[3]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L11N_T1U_N9_GC_67_AN34
set_property PACKAGE_PIN Y36               [get_ports "c0_ddr4_dq[30]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L2P_T0L_N2_68_Y36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[30]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L2P_T0L_N2_68_Y36
set_property PACKAGE_PIN AB35              [get_ports "c0_ddr4_dq[31]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L6N_T0U_N11_AD6N_68_AB35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[31]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L6N_T0U_N11_AD6N_68_AB35
set_property PACKAGE_PIN AL34              [get_ports "c0_ddr4_dq[32]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L15N_T2L_N5_AD11N_67_AL34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[32]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L15N_T2L_N5_AD11N_67_AL34
set_property PACKAGE_PIN AL36              [get_ports "c0_ddr4_dq[33]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L14N_T2L_N3_GC_67_AL36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[33]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L14N_T2L_N3_GC_67_AL36
set_property PACKAGE_PIN AL35              [get_ports "c0_ddr4_dq[34]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L14P_T2L_N2_GC_67_AL35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[34]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L14P_T2L_N2_GC_67_AL35
set_property PACKAGE_PIN AK36              [get_ports "c0_ddr4_dq[35]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L17P_T2U_N8_AD10P_67_AK36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[35]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L17P_T2U_N8_AD10P_67_AK36
set_property PACKAGE_PIN AL33              [get_ports "c0_ddr4_dq[36]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L15P_T2L_N4_AD11P_67_AL33
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[36]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L15P_T2L_N4_AD11P_67_AL33
set_property PACKAGE_PIN AK37              [get_ports "c0_ddr4_dq[37]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L17N_T2U_N9_AD10N_67_AK37
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[37]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L17N_T2U_N9_AD10N_67_AK37
set_property PACKAGE_PIN AJ36              [get_ports "c0_ddr4_dq[38]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L18N_T2U_N11_AD2N_67_AJ36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[38]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L18N_T2U_N11_AD2N_67_AJ36
set_property PACKAGE_PIN AJ35              [get_ports "c0_ddr4_dq[39]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L18P_T2U_N10_AD2P_67_AJ35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[39]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L18P_T2U_N10_AD2P_67_AJ35
set_property PACKAGE_PIN AM33              [get_ports "c0_ddr4_dq[4]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L11P_T1U_N8_GC_67_AM33
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[4]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L11P_T1U_N8_GC_67_AM33
set_property PACKAGE_PIN AG35              [get_ports "c0_ddr4_dq[40]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L23P_T3U_N8_67_AG35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[40]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L23P_T3U_N8_67_AG35
set_property PACKAGE_PIN AH32              [get_ports "c0_ddr4_dq[41]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L21P_T3L_N4_AD8P_67_AH32
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[41]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L21P_T3L_N4_AD8P_67_AH32
set_property PACKAGE_PIN AH35              [get_ports "c0_ddr4_dq[42]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L23N_T3U_N9_67_AH35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[42]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L23N_T3U_N9_67_AH35
set_property PACKAGE_PIN AG37              [get_ports "c0_ddr4_dq[43]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L24N_T3U_N11_67_AG37
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[43]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L24N_T3U_N11_67_AG37
set_property PACKAGE_PIN AH34              [get_ports "c0_ddr4_dq[44]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L20P_T3L_N2_AD1P_67_AH34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[44]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L20P_T3L_N2_AD1P_67_AH34
set_property PACKAGE_PIN AJ32              [get_ports "c0_ddr4_dq[45]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L21N_T3L_N5_AD8N_67_AJ32
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[45]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L21N_T3L_N5_AD8N_67_AJ32
set_property PACKAGE_PIN AJ34              [get_ports "c0_ddr4_dq[46]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L20N_T3L_N3_AD1N_67_AJ34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[46]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L20N_T3L_N3_AD1N_67_AJ34
set_property PACKAGE_PIN AG36              [get_ports "c0_ddr4_dq[47]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L24P_T3U_N10_67_AG36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[47]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L24P_T3U_N10_67_AG36
set_property PACKAGE_PIN AE36              [get_ports "c0_ddr4_dq[48]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L9P_T1L_N4_AD12P_68_AE36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[48]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L9P_T1L_N4_AD12P_68_AE36
set_property PACKAGE_PIN AC34              [get_ports "c0_ddr4_dq[49]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L11P_T1U_N8_GC_68_AC34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[49]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L11P_T1U_N8_GC_68_AC34
set_property PACKAGE_PIN AR37              [get_ports "c0_ddr4_dq[5]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L8N_T1L_N3_AD5N_67_AR37
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[5]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L8N_T1L_N3_AD5N_67_AR37
set_property PACKAGE_PIN AD36              [get_ports "c0_ddr4_dq[50]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L8P_T1L_N2_AD5P_68_AD36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[50]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L8P_T1L_N2_AD5P_68_AD36
set_property PACKAGE_PIN AD34              [get_ports "c0_ddr4_dq[51]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L11N_T1U_N9_GC_68_AD34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[51]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L11N_T1U_N9_GC_68_AD34
set_property PACKAGE_PIN AE37              [get_ports "c0_ddr4_dq[52]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L8N_T1L_N3_AD5N_68_AE37
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[52]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L8N_T1L_N3_AD5N_68_AE37
set_property PACKAGE_PIN AE34              [get_ports "c0_ddr4_dq[53]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L12P_T1U_N10_GC_68_AE34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[53]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L12P_T1U_N10_GC_68_AE34
set_property PACKAGE_PIN AF36              [get_ports "c0_ddr4_dq[54]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L9N_T1L_N5_AD12N_68_AF36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[54]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L9N_T1L_N5_AD12N_68_AF36
set_property PACKAGE_PIN AF34              [get_ports "c0_ddr4_dq[55]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L12N_T1U_N11_GC_68_AF34
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[55]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L12N_T1U_N11_GC_68_AF34
set_property PACKAGE_PIN AB33              [get_ports "c0_ddr4_dq[56]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L18P_T2U_N10_AD2P_68_AB33
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[56]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L18P_T2U_N10_AD2P_68_AB33
set_property PACKAGE_PIN AD30              [get_ports "c0_ddr4_dq[57]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L14P_T2L_N2_GC_68_AD30
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[57]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L14P_T2L_N2_GC_68_AD30
set_property PACKAGE_PIN AC33              [get_ports "c0_ddr4_dq[58]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L18N_T2U_N11_AD2N_68_AC33
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[58]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L18N_T2U_N11_AD2N_68_AC33
set_property PACKAGE_PIN AC32              [get_ports "c0_ddr4_dq[59]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L17P_T2U_N8_AD10P_68_AC32
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[59]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L17P_T2U_N8_AD10P_68_AC32
set_property PACKAGE_PIN AN35              [get_ports "c0_ddr4_dq[6]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L12N_T1U_N11_GC_67_AN35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[6]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L12N_T1U_N11_GC_67_AN35
set_property PACKAGE_PIN AD32              [get_ports "c0_ddr4_dq[60]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L17N_T2U_N9_AD10N_68_AD32
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[60]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L17N_T2U_N9_AD10N_68_AD32
set_property PACKAGE_PIN AC29              [get_ports "c0_ddr4_dq[61]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L15P_T2L_N4_AD11P_68_AC29
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[61]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L15P_T2L_N4_AD11P_68_AC29
set_property PACKAGE_PIN AE31              [get_ports "c0_ddr4_dq[62]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L14N_T2L_N3_GC_68_AE31
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[62]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L14N_T2L_N3_GC_68_AE31
set_property PACKAGE_PIN AD29              [get_ports "c0_ddr4_dq[63]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L15N_T2L_N5_AD11N_68_AD29
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[63]"]        ;#  Bank  68 VCCO - 1V2_VCCO - IO_L15N_T2L_N5_AD11N_68_AD29
set_property PACKAGE_PIN AU33              [get_ports "c0_ddr4_dq[64]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L2N_T0L_N3_67_AU33
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[64]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L2N_T0L_N3_67_AU33
set_property PACKAGE_PIN AT36              [get_ports "c0_ddr4_dq[65]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L5N_T0U_N9_AD14N_67_AT36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[65]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L5N_T0U_N9_AD14N_67_AT36
set_property PACKAGE_PIN AT33              [get_ports "c0_ddr4_dq[66]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L2P_T0L_N2_67_AT33
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[66]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L2P_T0L_N2_67_AT33
set_property PACKAGE_PIN AR36              [get_ports "c0_ddr4_dq[67]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L6N_T0U_N11_AD6N_67_AR36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[67]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L6N_T0U_N11_AD6N_67_AR36
set_property PACKAGE_PIN AR32              [get_ports "c0_ddr4_dq[68]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L3P_T0L_N4_AD15P_67_AR32
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[68]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L3P_T0L_N4_AD15P_67_AR32
set_property PACKAGE_PIN AP35              [get_ports "c0_ddr4_dq[69]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L6P_T0U_N10_AD6P_67_AP35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[69]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L6P_T0U_N10_AD6P_67_AP35
set_property PACKAGE_PIN AP36              [get_ports "c0_ddr4_dq[7]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L8P_T1L_N2_AD5P_67_AP36
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[7]"]         ;#  Bank  67 VCCO - 1V2_VCCO - IO_L8P_T1L_N2_AD5P_67_AP36
set_property PACKAGE_PIN AT35              [get_ports "c0_ddr4_dq[70]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L5P_T0U_N8_AD14P_67_AT35
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[70]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L5P_T0U_N8_AD14P_67_AT35
set_property PACKAGE_PIN AR33              [get_ports "c0_ddr4_dq[71]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L3N_T0L_N5_AD15N_67_AR33
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[71]"]        ;#  Bank  67 VCCO - 1V2_VCCO - IO_L3N_T0L_N5_AD15N_67_AR33
set_property PACKAGE_PIN AJ29              [get_ports "c0_ddr4_dq[8]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L21N_T3L_N5_AD8N_66_AJ29
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[8]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L21N_T3L_N5_AD8N_66_AJ29
set_property PACKAGE_PIN AF31              [get_ports "c0_ddr4_dq[9]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L24P_T3U_N10_66_AF31
set_property IOSTANDARD POD12_DCI          [get_ports "c0_ddr4_dq[9]"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L24P_T3U_N10_66_AF31
set_property PACKAGE_PIN AN32              [get_ports "c0_ddr4_dqs_c[0]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L10N_T1U_N7_QBC_AD4N_67_AN32
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_c[0]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L10N_T1U_N7_QBC_AD4N_67_AN32
set_property PACKAGE_PIN AH30              [get_ports "c0_ddr4_dqs_c[1]"]      ;#  Bank  66 VCCO - 1V2_VCCO - IO_L22N_T3U_N7_DBC_AD0N_66_AH30
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_c[1]"]      ;#  Bank  66 VCCO - 1V2_VCCO - IO_L22N_T3U_N7_DBC_AD0N_66_AH30
set_property PACKAGE_PIN AA31              [get_ports "c0_ddr4_dqs_c[2]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L22N_T3U_N7_DBC_AD0N_68_AA31
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_c[2]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L22N_T3U_N7_DBC_AD0N_68_AA31
set_property PACKAGE_PIN W35               [get_ports "c0_ddr4_dqs_c[3]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L4N_T0U_N7_DBC_AD7N_68_W35
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_c[3]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L4N_T0U_N7_DBC_AD7N_68_W35
set_property PACKAGE_PIN AK34              [get_ports "c0_ddr4_dqs_c[4]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L16N_T2U_N7_QBC_AD3N_67_AK34
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_c[4]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L16N_T2U_N7_QBC_AD3N_67_AK34
set_property PACKAGE_PIN AG33              [get_ports "c0_ddr4_dqs_c[5]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L22N_T3U_N7_DBC_AD0N_67_AG33
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_c[5]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L22N_T3U_N7_DBC_AD0N_67_AG33
set_property PACKAGE_PIN AD35              [get_ports "c0_ddr4_dqs_c[6]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L10N_T1U_N7_QBC_AD4N_68_AD35
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_c[6]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L10N_T1U_N7_QBC_AD4N_68_AD35
set_property PACKAGE_PIN AD31              [get_ports "c0_ddr4_dqs_c[7]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L16N_T2U_N7_QBC_AD3N_68_AD31
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_c[7]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L16N_T2U_N7_QBC_AD3N_68_AD31
set_property PACKAGE_PIN AU35              [get_ports "c0_ddr4_dqs_c[8]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L4N_T0U_N7_DBC_AD7N_67_AU35
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_c[8]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L4N_T0U_N7_DBC_AD7N_67_AU35
set_property PACKAGE_PIN AM32              [get_ports "c0_ddr4_dqs_t[0]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L10P_T1U_N6_QBC_AD4P_67_AM32
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_t[0]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L10P_T1U_N6_QBC_AD4P_67_AM32
set_property PACKAGE_PIN AG30              [get_ports "c0_ddr4_dqs_t[1]"]      ;#  Bank  66 VCCO - 1V2_VCCO - IO_L22P_T3U_N6_DBC_AD0P_66_AG30
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_t[1]"]      ;#  Bank  66 VCCO - 1V2_VCCO - IO_L22P_T3U_N6_DBC_AD0P_66_AG30
set_property PACKAGE_PIN Y31               [get_ports "c0_ddr4_dqs_t[2]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L22P_T3U_N6_DBC_AD0P_68_Y31
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_t[2]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L22P_T3U_N6_DBC_AD0P_68_Y31
set_property PACKAGE_PIN W34               [get_ports "c0_ddr4_dqs_t[3]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L4P_T0U_N6_DBC_AD7P_68_W34
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_t[3]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L4P_T0U_N6_DBC_AD7P_68_W34
set_property PACKAGE_PIN AK33              [get_ports "c0_ddr4_dqs_t[4]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L16P_T2U_N6_QBC_AD3P_67_AK33
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_t[4]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L16P_T2U_N6_QBC_AD3P_67_AK33
set_property PACKAGE_PIN AF33              [get_ports "c0_ddr4_dqs_t[5]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L22P_T3U_N6_DBC_AD0P_67_AF33
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_t[5]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L22P_T3U_N6_DBC_AD0P_67_AF33
set_property PACKAGE_PIN AC35              [get_ports "c0_ddr4_dqs_t[6]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L10P_T1U_N6_QBC_AD4P_68_AC35
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_t[6]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L10P_T1U_N6_QBC_AD4P_68_AC35
set_property PACKAGE_PIN AC30              [get_ports "c0_ddr4_dqs_t[7]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L16P_T2U_N6_QBC_AD3P_68_AC30
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_t[7]"]      ;#  Bank  68 VCCO - 1V2_VCCO - IO_L16P_T2U_N6_QBC_AD3P_68_AC30
set_property PACKAGE_PIN AT34              [get_ports "c0_ddr4_dqs_t[8]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L4P_T0U_N6_DBC_AD7P_67_AT34
set_property IOSTANDARD DIFF_POD12_DCI     [get_ports "c0_ddr4_dqs_t[8]"]      ;#  Bank  67 VCCO - 1V2_VCCO - IO_L4P_T0U_N6_DBC_AD7P_67_AT34
set_property PACKAGE_PIN AP27              [get_ports "c0_ddr4_odt[0]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L12N_T1U_N11_GC_66_AP27
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_odt[0]"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L12N_T1U_N11_GC_66_AP27
set_property PACKAGE_PIN AP26              [get_ports "c0_ddr4_parity"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L12P_T1U_N10_GC_66_AP26
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_parity"]        ;#  Bank  66 VCCO - 1V2_VCCO - IO_L12P_T1U_N10_GC_66_AP26
set_property PACKAGE_PIN AU28              [get_ports "c0_ddr4_ras_b"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L9N_T1L_N5_AD12N_66_AU28
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_ras_b"]         ;#  Bank  66 VCCO - 1V2_VCCO - IO_L9N_T1L_N5_AD12N_66_AU28
set_property PACKAGE_PIN AR26              [get_ports "c0_ddr4_we_b"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L11P_T1U_N8_GC_66_AR26
set_property IOSTANDARD SSTL12_DCI         [get_ports "c0_ddr4_we_b"]          ;#  Bank  66 VCCO - 1V2_VCCO - IO_L11P_T1U_N8_GC_66_AR26
set_property PACKAGE_PIN AK31              [get_ports "c0_ddr4_reset_b_fpga"]  ;#  Bank  66 VCCO - 1V2_VCCO - IO_T3U_N12_66_AK31
set_property IOSTANDARD LVCMOS12           [get_ports "c0_ddr4_reset_b_fpga"]  ;#  Bank  66 VCCO - 1V2_VCCO - IO_T3U_N12_66_AK31

#################################################################################
#
# DSFP GTY Connections - Bank 231
#
#################################################################################

set_property PACKAGE_PIN J7                [get_ports "DSFP28_1_TX_P[1]"]      ;# Bank 231 - MGTYTXP0_231 
set_property PACKAGE_PIN J6                [get_ports "DSFP28_1_TX_N[1]"]      ;# Bank 231 - MGTYTXN0_231 
set_property PACKAGE_PIN K4                [get_ports "DSFP28_1_RX_P[1]"]      ;# Bank 231 - MGTYRXP0_231 
set_property PACKAGE_PIN K3                [get_ports "DSFP28_1_RX_N[1]"]      ;# Bank 231 - MGTYRXN0_231 
set_property PACKAGE_PIN H5                [get_ports "DSFP28_1_TX_P[2]"]      ;# Bank 231 - MGTYTXP1_231 
set_property PACKAGE_PIN H4                [get_ports "DSFP28_1_TX_N[2]"]      ;# Bank 231 - MGTYTXN1_231 
set_property PACKAGE_PIN J2                [get_ports "DSFP28_1_RX_P[2]"]      ;# Bank 231 - MGTYRXP1_231 
set_property PACKAGE_PIN J1                [get_ports "DSFP28_1_RX_N[2]"]      ;# Bank 231 - MGTYRXN1_231 
set_property PACKAGE_PIN G7                [get_ports "DSFP28_0_TX_P[1]"]      ;# Bank 231 - MGTYTXP2_231 
set_property PACKAGE_PIN G6                [get_ports "DSFP28_0_TX_N[1]"]      ;# Bank 231 - MGTYTXN2_231 
set_property PACKAGE_PIN G2                [get_ports "DSFP28_0_RX_P[1]"]      ;# Bank 231 - MGTYRXP2_231 
set_property PACKAGE_PIN G1                [get_ports "DSFP28_0_RX_N[1]"]      ;# Bank 231 - MGTYRXN2_231 
set_property PACKAGE_PIN F5                [get_ports "DSFP28_0_TX_P[2]"]      ;# Bank 231 - MGTYTXP3_231 
set_property PACKAGE_PIN F4                [get_ports "DSFP28_0_TX_N[2]"]      ;# Bank 231 - MGTYTXN3_231 
set_property PACKAGE_PIN E2                [get_ports "DSFP28_0_RX_P[2]"]      ;# Bank 231 - MGTYRXP3_231 
set_property PACKAGE_PIN E1                [get_ports "DSFP28_0_RX_N[2]"]      ;# Bank 231 - MGTYRXN3_231 


# Cage 1 LED

set_property PACKAGE_PIN AH24              [get_ports "CAGE_1_L0_LEDR"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L9P_T1L_N4_AD12P_A14_D30_65_AH24
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_1_L0_LEDR"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L9P_T1L_N4_AD12P_A14_D30_65_AH24
set_property PACKAGE_PIN AL24              [get_ports "CAGE_1_L0_LEDB"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L8N_T1L_N3_AD5N_A17_65_AL24
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_1_L0_LEDB"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L8N_T1L_N3_AD5N_A17_65_AL24
set_property PACKAGE_PIN AK24              [get_ports "CAGE_1_L0_LEDG"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L8P_T1L_N2_AD5P_A16_65_AK24
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_1_L0_LEDG"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L8P_T1L_N2_AD5P_A16_65_AK24
set_property PACKAGE_PIN AJ25              [get_ports "CAGE_1_L1_LEDR"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L7N_T1L_N1_QBC_AD13N_A19_65_AJ25
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_1_L1_LEDR"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L7N_T1L_N1_QBC_AD13N_A19_65_AJ25
set_property PACKAGE_PIN AH25              [get_ports "CAGE_1_L1_LEDB"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L7P_T1L_N0_QBC_AD13P_A18_65_AH25
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_1_L1_LEDB"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L7P_T1L_N0_QBC_AD13P_A18_65_AH25
set_property PACKAGE_PIN AN24              [get_ports "CAGE_1_L1_LEDG"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_T0U_N12_VRP_A28_65_AN24
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_1_L1_LEDG"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_T0U_N12_VRP_A28_65_AN24

#Cage 0 LED

set_property PACKAGE_PIN AM23              [get_ports "CAGE_0_L0_LEDR"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L5N_T0U_N9_AD14N_A23_65_AM23
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_0_L0_LEDR"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L5N_T0U_N9_AD14N_A23_65_AM23
set_property PACKAGE_PIN AM22              [get_ports "CAGE_0_L0_LEDB"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L5P_T0U_N8_AD14P_A22_65_AM22
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_0_L0_LEDB"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L5P_T0U_N8_AD14P_A22_65_AM22
set_property PACKAGE_PIN AN23              [get_ports "CAGE_0_L0_LEDG"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L4N_T0U_N7_DBC_AD7N_A25_65_AN23
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_0_L0_LEDG"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L4N_T0U_N7_DBC_AD7N_A25_65_AN23
set_property PACKAGE_PIN AN22              [get_ports "CAGE_0_L1_LEDR"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L4P_T0U_N6_DBC_AD7P_A24_65_AN22
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_0_L1_LEDR"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L4P_T0U_N6_DBC_AD7P_A24_65_AN22
set_property PACKAGE_PIN AP25              [get_ports "CAGE_0_L1_LEDB"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L3N_T0L_N5_AD15N_A27_65_AP25
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_0_L1_LEDB"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L3N_T0L_N5_AD15N_A27_65_AP25
set_property PACKAGE_PIN AN25              [get_ports "CAGE_0_L1_LEDG"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L3P_T0L_N4_AD15P_A26_65_AN25
set_property IOSTANDARD LVCMOS18           [get_ports "CAGE_0_L1_LEDG"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L3P_T0L_N4_AD15P_A26_65_AN25

#################################################################################
#
#  Satellite Controller I/F Signals
#
#################################################################################

# FPGA SUC UART (115200, No parity, 8 bits, 1 stop bit) - Bank 65

set_property PACKAGE_PIN AK21              [get_ports "FPGA_SUC_RXD_R"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L13N_T2L_N1_GC_QBC_A07_D23_65_AK21
set_property IOSTANDARD LVCMOS18           [get_ports "FPGA_SUC_RXD_R"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L13N_T2L_N1_GC_QBC_A07_D23_65_AK21
set_property PACKAGE_PIN AJ21              [get_ports "FPGA_SUC_TXD_R"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L13P_T2L_N0_GC_QBC_A06_D22_65_AJ21
set_property IOSTANDARD LVCMOS18           [get_ports "FPGA_SUC_TXD_R"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L13P_T2L_N0_GC_QBC_A06_D22_65_AJ21

# Satellite Controller to FPGA

set_property PACKAGE_PIN AM17              [get_ports "SUC_FPGA_GPIO1"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L20P_T3L_N2_AD1P_D08_65_AM17
set_property IOSTANDARD LVCMOS18           [get_ports "SUC_FPGA_GPIO1"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L20P_T3L_N2_AD1P_D08_65_AM17
set_property PACKAGE_PIN AL18              [get_ports "SUC_FPGA_GPIO2"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L16P_T2U_N6_QBC_AD3P_A00_D16_65_AL18
set_property IOSTANDARD LVCMOS18           [get_ports "SUC_FPGA_GPIO2"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L16P_T2U_N6_QBC_AD3P_A00_D16_65_AL18

# FPGA I2C

set_property PACKAGE_PIN AJ17              [get_ports "FPGA_SDA_R"]            ;#  Bank  65 VCCO - +1V8_SYS - IO_L23N_T3U_N9_PERSTN1_I2C_SDA_65_AJ17
set_property IOSTANDARD LVCMOS18           [get_ports "FPGA_SDA_R"]            ;#  Bank  65 VCCO - +1V8_SYS - IO_L23N_T3U_N9_PERSTN1_I2C_SDA_65_AJ17
set_property PACKAGE_PIN AJ16              [get_ports "FPGA_SCL_R"]            ;#  Bank  65 VCCO - +1V8_SYS - IO_L23P_T3U_N8_I2C_SCLK_65_AJ16
set_property IOSTANDARD LVCMOS18           [get_ports "FPGA_SCL_R"]            ;#  Bank  65 VCCO - +1V8_SYS - IO_L23P_T3U_N8_I2C_SCLK_65_AJ16


#################################################################################
#
#  Miscellaneous connections
#
#################################################################################


# FPGA to ADK2 UART

set_property PACKAGE_PIN AR24              [get_ports "FPGA_UART1_RXD"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L2N_T0L_N3_FWE_FCS2_B_65_AR24
set_property IOSTANDARD LVCMOS18           [get_ports "FPGA_UART1_RXD"]        ;#  Bank  65 VCCO - +1V8_SYS - IO_L2N_T0L_N3_FWE_FCS2_B_65_AR24
set_property PACKAGE_PIN AP24              [get_ports "FPGA_UART1_TXD"]      ;#  Bank  65 VCCO - +1V8_SYS - IO_L2P_T0L_N2_FOE_B_65_AP24
set_property IOSTANDARD LVCMOS18           [get_ports "FPGA_UART1_TXD"]      ;#  Bank  65 VCCO - +1V8_SYS - IO_L2P_T0L_N2_FOE_B_65_AP24

# SI Clock Generator Pins

set_property PACKAGE_PIN AN20              [get_ports "SI_RSTBB_R"]            ;#  Bank  65 VCCO - +1V8_SYS - IO_L18N_T2U_N11_AD2N_D13_65_AN20
set_property IOSTANDARD LVCMOS18           [get_ports "SI_RSTBB_R"]            ;#  Bank  65 VCCO - +1V8_SYS - IO_L18N_T2U_N11_AD2N_D13_65_AN20
set_property PACKAGE_PIN AJ19              [get_ports "SI_PLL_LOCK_R"]         ;#  Bank  65 VCCO - +1V8_SYS - IO_L15N_T2L_N5_AD11N_A03_D19_65_AJ19
set_property IOSTANDARD LVCMOS18           [get_ports "SI_PLL_LOCK_R"]         ;#  Bank  65 VCCO - +1V8_SYS - IO_L15N_T2L_N5_AD11N_A03_D19_65_AJ19
set_property PACKAGE_PIN AH19              [get_ports "SI_INTRB_R"]            ;#  Bank  65 VCCO - +1V8_SYS - IO_L15P_T2L_N4_AD11P_A02_D18_65_AH19
set_property IOSTANDARD LVCMOS18           [get_ports "SI_INTRB_R"]            ;#  Bank  65 VCCO - +1V8_SYS - IO_L15P_T2L_N4_AD11P_A02_D18_65_AH19
set_property PACKAGE_PIN AJ20              [get_ports "SI_IN_LOS_R"]           ;#  Bank  65 VCCO - +1V8_SYS - IO_L14N_T2L_N3_GC_A05_D21_65_AJ20
set_property IOSTANDARD LVCMOS18           [get_ports "SI_IN_LOS_R"]           ;#  Bank  65 VCCO - +1V8_SYS - IO_L14N_T2L_N3_GC_A05_D21_65_AJ20

#
#  75Mhz Osc for FPGA Configuration - Bank 65 (1.8V)
#     This pin is meant for configuration, not general use
#
# set_property PACKAGE_PIN AH17              [get_ports "CLK_EMCCLK_75M_BANK65"] ;#  Bank  65 VCCO - +1V8_SYS - IO_L24P_T3U_N10_EMCCLK_65_AH17
# set_property IOSTANDARD LVCMOS18           [get_ports "CLK_EMCCLK_75M_BANK65"] ;#  Bank  65 VCCO - +1V8_SYS - IO_L24P_T3U_N10_EMCCLK_65_AH17

#
#  Probe Point - Bank 65 (1.8V)
#     Uncomment following properties if TESTCLK used in your design
#     TESTCLK is a testpoint on the card and not accessible
#
# set_property PACKAGE_PIN AT24              [get_ports "TESTCLK_OUT"]           ;#  Bank  65 VCCO - +1V8_SYS - IO_L1P_T0L_N0_DBC_RS0_65_AT24
# set_property IOSTANDARD LVCMOS18           [get_ports "TESTCLK_OUT"]           ;#  Bank  65 VCCO - +1V8_SYS - IO_L1P_T0L_N0_DBC_RS0_65_AT24

#
#  PPS Connection - Bank 65 (1.8V)
#     Uncomment following properties if PPS pins used in your design
#
# set_property PACKAGE_PIN AM25              [get_ports "PPS_IN_FPGA"]           ;#  Bank  65 VCCO - +1V8_SYS - IO_L6N_T0U_N11_AD6N_A21_65_AM25
# set_property IOSTANDARD LVCMOS18           [get_ports "PPS_IN_FPGA"]           ;#  Bank  65 VCCO - +1V8_SYS - IO_L6N_T0U_N11_AD6N_A21_65_AM25
# set_property PACKAGE_PIN AL25              [get_ports "PPS_OUT_FPGA"]          ;#  Bank  65 VCCO - +1V8_SYS - IO_L6P_T0U_N10_AD6P_A20_65_AL25
# set_property IOSTANDARD LVCMOS18           [get_ports "PPS_OUT_FPGA"]          ;#  Bank  65 VCCO - +1V8_SYS - IO_L6P_T0U_N10_AD6P_A20_65_AL25

#################################################################################
#
# Ground pins for reference


# set_property PACKAGE_PIN AR2               [get_ports "GND"]                   ;# Bank 226 - MGTYRXP0_226 
# set_property PACKAGE_PIN AR1               [get_ports "GND"]                   ;# Bank 226 - MGTYRXN0_226 
# set_property PACKAGE_PIN AN2               [get_ports "GND"]                   ;# Bank 226 - MGTYRXP1_226 
# set_property PACKAGE_PIN AN1               [get_ports "GND"]                   ;# Bank 226 - MGTYRXN1_226 
# set_property PACKAGE_PIN AM4               [get_ports "GND"]                   ;# Bank 226 - MGTYRXP2_226 
# set_property PACKAGE_PIN AM3               [get_ports "GND"]                   ;# Bank 226 - MGTYRXN2_226 
# set_property PACKAGE_PIN AL2               [get_ports "GND"]                   ;# Bank 226 - MGTYRXP3_226 
# set_property PACKAGE_PIN AL1               [get_ports "GND"]                   ;# Bank 226 - MGTYRXN3_226 

# set_property PACKAGE_PIN AK4               [get_ports "GND"]                   ;# Bank 227 - MGTYRXP0_227 
# set_property PACKAGE_PIN AK3               [get_ports "GND"]                   ;# Bank 227 - MGTYRXN0_227 
# set_property PACKAGE_PIN AJ2               [get_ports "GND"]                   ;# Bank 227 - MGTYRXP1_227 
# set_property PACKAGE_PIN AJ1               [get_ports "GND"]                   ;# Bank 227 - MGTYRXN1_227 
# set_property PACKAGE_PIN AG2               [get_ports "GND"]                   ;# Bank 227 - MGTYRXP2_227 
# set_property PACKAGE_PIN AG1               [get_ports "GND"]                   ;# Bank 227 - MGTYRXN2_227 
# set_property PACKAGE_PIN AF4               [get_ports "GND"]                   ;# Bank 227 - MGTYRXP3_227 
# set_property PACKAGE_PIN AF3               [get_ports "GND"]                   ;# Bank 227 - MGTYRXN3_227 

# set_property PACKAGE_PIN AE2               [get_ports "GND"]                   ;# Bank 228 - MGTYRXP0_228 
# set_property PACKAGE_PIN AE1               [get_ports "GND"]                   ;# Bank 228 - MGTYRXN0_228 
# set_property PACKAGE_PIN AC2               [get_ports "GND"]                   ;# Bank 228 - MGTYRXP1_228 
# set_property PACKAGE_PIN AC1               [get_ports "GND"]                   ;# Bank 228 - MGTYRXN1_228 
# set_property PACKAGE_PIN AB4               [get_ports "GND"]                   ;# Bank 228 - MGTYRXP2_228 
# set_property PACKAGE_PIN AB3               [get_ports "GND"]                   ;# Bank 228 - MGTYRXN2_228 
# set_property PACKAGE_PIN AA2               [get_ports "GND"]                   ;# Bank 228 - MGTYRXP3_228 
# set_property PACKAGE_PIN AA1               [get_ports "GND"]                   ;# Bank 228 - MGTYRXN3_228  

# set_property PACKAGE_PIN Y4                [get_ports "GND"]                   ;# Bank 229 - MGTYRXP0_229 
# set_property PACKAGE_PIN Y3                [get_ports "GND"]                   ;# Bank 229 - MGTYRXN0_229 
# set_property PACKAGE_PIN W2                [get_ports "GND"]                   ;# Bank 229 - MGTYRXP1_229 
# set_property PACKAGE_PIN W1                [get_ports "GND"]                   ;# Bank 229 - MGTYRXN1_229 
# set_property PACKAGE_PIN V4                [get_ports "GND"]                   ;# Bank 229 - MGTYRXP2_229 
# set_property PACKAGE_PIN V3                [get_ports "GND"]                   ;# Bank 229 - MGTYRXN2_229 
# set_property PACKAGE_PIN U2                [get_ports "GND"]                   ;# Bank 229 - MGTYRXP3_229 
# set_property PACKAGE_PIN U1                [get_ports "GND"]                   ;# Bank 229 - MGTYRXN3_229 

# set_property PACKAGE_PIN T4                [get_ports "GND"]                   ;# Bank 230 - MGTYRXP0_230 
# set_property PACKAGE_PIN T3                [get_ports "GND"]                   ;# Bank 230 - MGTYRXN0_230 
# set_property PACKAGE_PIN R2                [get_ports "GND"]                   ;# Bank 230 - MGTYRXP1_230 
# set_property PACKAGE_PIN R1                [get_ports "GND"]                   ;# Bank 230 - MGTYRXN1_230 
# set_property PACKAGE_PIN N2                [get_ports "GND"]                   ;# Bank 230 - MGTYRXP2_230 
# set_property PACKAGE_PIN N1                [get_ports "GND"]                   ;# Bank 230 - MGTYRXN2_230 
# set_property PACKAGE_PIN L2                [get_ports "GND"]                   ;# Bank 230 - MGTYRXP3_230 
# set_property PACKAGE_PIN L1                [get_ports "GND"]                   ;# Bank 230 - MGTYRXN3_230 

# set_property PACKAGE_PIN D4                [get_ports "GND"]                   ;# Bank 232 - MGTYRXP0_232 
# set_property PACKAGE_PIN D3                [get_ports "GND"]                   ;# Bank 232 - MGTYRXN0_232 
# set_property PACKAGE_PIN C2                [get_ports "GND"]                   ;# Bank 232 - MGTYRXP1_232 
# set_property PACKAGE_PIN C1                [get_ports "GND"]                   ;# Bank 232 - MGTYRXN1_232 

# set_property PACKAGE_PIN A13               [get_ports "GND"]                   ;# Bank 234 - MGTMRXP0_234 
# set_property PACKAGE_PIN A12               [get_ports "GND"]                   ;# Bank 234 - MGTMRXN0_234 
# set_property PACKAGE_PIN A16               [get_ports "GND"]                   ;# Bank 234 - MGTMRXP1_234 
# set_property PACKAGE_PIN A15               [get_ports "GND"]                   ;# Bank 234 - MGTMRXN1_234 
# set_property PACKAGE_PIN A7                [get_ports "GND"]                   ;# Bank 233 - MGTMRXP0_233 
# set_property PACKAGE_PIN A6                [get_ports "GND"]                   ;# Bank 233 - MGTMRXN0_233 
# set_property PACKAGE_PIN A10               [get_ports "GND"]                   ;# Bank 233 - MGTMRXP1_233 
# set_property PACKAGE_PIN A9                [get_ports "GND"]                   ;# Bank 233 - MGTMRXN1_233 
