#clock
set_property PACKAGE_PIN W5 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]

#selection
set_property PACKAGE_PIN R2 [get_ports {selection}]
set_property IOSTANDARD LVCMOS33 [get_ports {selection}]

#turn off
set_property PACKAGE_PIN T1 [get_ports {turn_off}]
set_property IOSTANDARD LVCMOS33 [get_ports {turn_off}]

#inputs (signals coming from LDR modules)
set_property PACKAGE_PIN G2 [get_ports {sensor_signal[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sensor_signal[0]}]

set_property PACKAGE_PIN J2 [get_ports {sensor_signal[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sensor_signal[1]}]

set_property PACKAGE_PIN L2 [get_ports {sensor_signal[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sensor_signal[2]}]

set_property PACKAGE_PIN J1 [get_ports {sensor_signal[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sensor_signal[3]}]

set_property PACKAGE_PIN G3 [get_ports {sensor_signal[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sensor_signal[4]}]

set_property PACKAGE_PIN H2 [get_ports {sensor_signal[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sensor_signal[5]}]

set_property PACKAGE_PIN K2 [get_ports {sensor_signal[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sensor_signal[6]}]

#note for speaker to play
set_property PACKAGE_PIN H1 [get_ports {output_note}]
set_property IOSTANDARD LVCMOS33 [get_ports {output_note}]

#outputs (BASYS3 LEDs)
set_property PACKAGE_PIN V3 [get_ports {output_LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output_LED[0]}]

set_property PACKAGE_PIN W3 [get_ports {output_LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output_LED[1]}]

set_property PACKAGE_PIN U3 [get_ports {output_LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output_LED[2]}]

set_property PACKAGE_PIN P3 [get_ports {output_LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output_LED[3]}]

set_property PACKAGE_PIN N3 [get_ports {output_LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output_LED[4]}]

set_property PACKAGE_PIN P1 [get_ports {output_LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output_LED[5]}]

set_property PACKAGE_PIN L1 [get_ports {output_LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output_LED[6]}]

#seven-segment display
set_property PACKAGE_PIN W7 [get_ports {seg_cathode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_cathode[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg_cathode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_cathode[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg_cathode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_cathode[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg_cathode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_cathode[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg_cathode[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_cathode[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg_cathode[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_cathode[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg_cathode[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_cathode[6]}]

set_property PACKAGE_PIN U2 [get_ports {seg_anode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {seg_anode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {seg_anode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {seg_anode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_anode[3]}]
	
#VGA display
set_property PACKAGE_PIN P19 [get_ports horiz_sync]						
	set_property IOSTANDARD LVCMOS33 [get_ports horiz_sync]
set_property PACKAGE_PIN R19 [get_ports vertic_sync]						
	set_property IOSTANDARD LVCMOS33 [get_ports vertic_sync]
set_property PACKAGE_PIN G19 [get_ports {Red_out[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Red_out[0]}]
set_property PACKAGE_PIN H19 [get_ports {Red_out[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Red_out[1]}]
set_property PACKAGE_PIN J19 [get_ports {Red_out[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Red_out[2]}]
set_property PACKAGE_PIN N19 [get_ports {Red_out[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Red_out[3]}]
set_property PACKAGE_PIN J17 [get_ports {Green_out[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Green_out[0]}]
set_property PACKAGE_PIN H17 [get_ports {Green_out[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Green_out[1]}]
set_property PACKAGE_PIN G17 [get_ports {Green_out[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Green_out[2]}]
set_property PACKAGE_PIN D17 [get_ports {Green_out[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Green_out[3]}]
set_property PACKAGE_PIN N18 [get_ports {Blue_out[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Blue_out[0]}]
set_property PACKAGE_PIN L18 [get_ports {Blue_out[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Blue_out[1]}]
set_property PACKAGE_PIN K18 [get_ports {Blue_out[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Blue_out[2]}]
set_property PACKAGE_PIN J18 [get_ports {Blue_out[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {Blue_out[3]}]