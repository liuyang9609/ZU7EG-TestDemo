#Clock cycle period constraint
create_clock -period 10.000 -name sysclk [get_ports diff_clock_clk_p]

set_property IOSTANDARD DIFF_SSTL12 [get_ports diff_clock_clk_p]
set_property PACKAGE_PIN A21 [get_ports {LED_o[1]}]
set_property PACKAGE_PIN A18 [get_ports {LED_o[0]}]
set_property PACKAGE_PIN K24 [get_ports RSTn_i]

set_property PACKAGE_PIN AH22 [get_ports diff_clock_clk_p]
set_property IOSTANDARD LVCMOS18 [get_ports {LED_o[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports RSTn_i]

#bit compress
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
