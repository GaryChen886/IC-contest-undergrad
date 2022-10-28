# operating conditions and boundary conditions #

set cycle  300.0        ;#clock period defined by designer

create_clock -period $cycle [get_ports  clk]
set_dont_touch_network      [get_clocks clk]
set_clock_uncertainty  0.1  [get_clocks clk]
set_clock_latency      0.5  [get_clocks clk]

set_input_delay  5      -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay 0.5    -clock clk [all_outputs] 
set_load         0.1     [all_outputs]
set_drive        1       [all_inputs]

set_operating_conditions  -min_library fsa0m_a_generic_core_ff1p98vm40c -min BCCOM -max_library fsa0m_a_generic_core_ss1p62v125c -max WCCOM
set_wire_load_model -name G5K -library fsa0m_a_generic_core_ss1p62v125c

set_max_fanout 20 [all_inputs]
