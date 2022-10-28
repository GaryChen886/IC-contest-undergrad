// This is generated automatically on 2022/01/19-14:42:00
// Check the # of bits for state registers !!!
// Check the # of bits for flag registers !!!

`ifndef __FLAG_DEF__
`define __FLAG_DEF__

// There're 5 states in this design
`define S_INIT                 	 0  
`define S_G                    	 1  
`define S_Y                    	 2  
`define S_R                    	 3  
`define S_END                  	 4  
`define S_ZVEC                 	 5'b0
`define STATE_W                	 5  

// Macro from template
`define BUF_SIZE               	 8'd66
`define READ_MEM_DELAY         	 2'd2
`define EMPTY_ADDR             	 {12{1'b0}}
`define EMPTY_DATA             	 {20{1'b0}}
`define LOCAL_IDX_W            	 16 
`define DATA_W                 	 20 

// Self-defined macro
`define CNT_W                  	 15 

`endif
