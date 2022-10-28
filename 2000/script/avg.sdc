# CHIP Level Constraint
set cycle  50.0        ; # clock period defined by designer
set t_in   5.0         ; # input delay defined by designer
set t_out  1.0         ; # output delay defined by designer

# Operating conditions
set_operating_conditions  -max slow  -min fast
# Wire load model
set_wire_load_model -name tsmc13_wl10 -library slow                        
# Design Environment
create_clock -name "clk" -period $cycle [get_ports  clk]
set_fix_hold                [get_clocks clk]
set_dont_touch_network      [get_clocks clk]
set_ideal_network           [get_clocks clk]
set_clock_uncertainty  0.1  [get_clocks clk]
set_clock_latency      0.5  [get_clocks clk]
set_input_transition   0.5  [all_inputs]
set_clock_transition   0.1  [all_clocks]
# Basic environment setup
set_input_delay  $t_in  -clock clk [remove_from_collection [all_inputs] [get_ports clk]] -clock_fall
set_output_delay 0.5    -clock clk [all_outputs] -clock_fall
set_load         1     [all_outputs]
set_drive        0.1   [all_inputs]

set_max_fanout 20 [all_inputs]
