set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN J1 [get_ports {north[0]}]
set_property PACKAGE_PIN L2 [get_ports {north[1]}]
set_property PACKAGE_PIN J2 [get_ports {north[2]}]

set_property PACKAGE_PIN G2 [get_ports {east[0]}]
set_property PACKAGE_PIN H1 [get_ports {east[1]}]
set_property PACKAGE_PIN K2 [get_ports {east[2]}]

set_property PACKAGE_PIN H2 [get_ports {south[0]}]
set_property PACKAGE_PIN G3 [get_ports {south[1]}]
set_property PACKAGE_PIN A14 [get_ports {south[2]}]

set_property PACKAGE_PIN A16 [get_ports {west[0]}]
set_property PACKAGE_PIN B15 [get_ports {west[1]}]
set_property PACKAGE_PIN B16 [get_ports {west[2]}]

set_property PACKAGE_PIN K3 [get_ports north_density]
set_property PACKAGE_PIN M3 [get_ports east_density]
set_property PACKAGE_PIN M1 [get_ports south_density]
set_property PACKAGE_PIN N1 [get_ports west_density]

set_property IOSTANDARD LVCMOS33 [get_ports *]

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]