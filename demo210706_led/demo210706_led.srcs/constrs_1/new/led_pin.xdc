create_clock -period 10.000 -name sysclk [get_ports diff_clk_p_i]

set_property IOSTANDARD DIFF_SSTL12 [get_ports diff_clk_p_i]
set_property PACKAGE_PIN AH22 [get_ports diff_clk_p_i]

set_property IOSTANDARD LVCMOS18 [get_ports rst_n_i]
set_property PACKAGE_PIN K24 [get_ports rst_n_i]

set_property IOSTANDARD LVCMOS18 [get_ports {led_o[*]}]
set_property PACKAGE_PIN A18 [get_ports {led_o[0]}]
set_property PACKAGE_PIN A21 [get_ports {led_o[1]}]

#bit compress
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]