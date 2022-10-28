// +FHDR------------------------------------------------------------------------
// Copyright (c) 2002, Global UniChip Corporation (UniChip).
// UniChip's Proprietary/Confidential
//
// All rights reserved. No part of this design may be reproduced or stored
// in a retrieval system, or transmitted, in any form or by any means,
// electronic, mechanical, photocopying, recording, or otherwise,
// without prior written permission of the Global UniChip Corporation.
// Unauthorized reproduction, duplication, use, or disclosure of this
// design will be deemed as infringement.
// -----------------------------------------------------------------------------
// FILE   : $Id: dic_2003.v,v 1.1 2003/04/25 04:01:19 ip01_11a Exp $
// TYPE   : Verilog Module
// AUTHOR : Tian-Sheuan Chang 
// -----------------------------------------------------------------------------
// KEYWORDS : 
// -----------------------------------------------------------------------------
// PURPOSE : 
// -----------------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME RANGE : DESCRIPTION : DEFAULT
// N/A
// -----------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy :  rst_n
// Clock Domains :   clk
// Critical Timing :
// Test Features :   N/A
// Asynchronous I/F :N/A
// Scan Methodology :MUX-based scan F.F.
// Instantiations :  N/A
// Other :           N/A
// -FHDR------------------------------------------------------------------------

`timescale 1ns/10ps
module mac_sim;
//define for simulator parameters
`define HPHASE 10
//`define FSDB 1
`define CYCLE (`HPHASE * 2)
`define DUMPFILE_NAME "mac.fsdb"
//define for instruction
parameter CLEAR =  3'b000;
parameter CLEAR2 = 3'b100;
parameter MUL_16 = 3'b001;
parameter MAC_16 = 3'b010;
parameter SAT_16 = 3'b011;
parameter MUL_8  = 3'b101;
parameter MAC_8  = 3'b110;
parameter SAT_8  = 3'b111;

parameter NO_STALL = 0;
parameter STALL    = 1;
// -----------------------------------------------------------------------------
// Constant declarations
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------

reg             reset_n;
reg             clk;
reg             stall;
reg [2:0]       instruction;
reg [15:0]      multiplier;
reg [15:0]      multiplicand;

// Beginning of automatic wires (for instantiated-module outputs)
wire [7:0]		protect;		// From u_mac of mac.v, ...
wire [31:0]		result;			// From u_mac of mac.v, ...
reg [7:0]		protect_g;		// From u_mac of mac.v, ...
reg [31:0]		result_g;		// From u_mac of mac.v, ...


// End of automatics

// ========================= Start of Main Code ================================
  mac u_mac(/*autoinst*/
	    // Outputs
	    .result			(result[31:0]),
	    .protect			(protect[7:0]),
	    // Inputs
	    .reset_n			(reset_n),
	    .clk			(clk),
	    .multiplier			(multiplier[15:0]),
	    .multiplicand		(multiplicand[15:0]),
	    .instruction		(instruction[2:0]),
	    .stall			(stall));
  
//---- clock generation
always begin
  #(`HPHASE) clk = 1'b0;
  #(`HPHASE) clk = 1'b1;
end

reg [31:0] cycle_cnt;

always @(posedge clk or negedge reset_n)
  if(~reset_n) 
    cycle_cnt <= 0;
  else
    cycle_cnt <= cycle_cnt + 1'b1;

integer result_file1;
integer result_file2;
reg  [39:0] data_base [0:85];
initial $readmemh("EXPECT.DAT", data_base);

integer i;
reg    [39:0] data_tmp;
reg    [9:0]  error_cnt;
reg     ready;

initial begin
      error_cnt = 0;
      @(negedge clk); // start to compare from 2nd cycle
      for  (i = 1; i <= 86; i = i + 1) begin
         data_tmp = data_base[i-1];
         @(negedge clk);
         if (protect !== data_tmp[39:32]) begin
           $display ("ERROR at cycle_cnt= %d: protect(%h)!= EXPECT(%h)", 
                      cycle_cnt, protect, data_tmp[39:32]); 
           error_cnt = error_cnt + 1;
         end
         if (result !== data_tmp[31:0]) begin
           $display ("ERROR at cycle_cnt= %d: result(%h)!= EXPECT(%h)", 
                      cycle_cnt,  result, data_tmp[31:0]); 
           error_cnt = error_cnt + 1;
         end
     end

     if(error_cnt == 10'b0) begin
      $display ("=================================================");
      $display ("Congratulation!, Your design PASSed all the test patterns "); 
      $display ("=================================================");
     end
     else begin
      $display ("=================================================");
      $display ("There're %d errors in your design", error_cnt); 
      $display ("=================================================");
     end
end  

/*
initial 
  $sdf_annotate ("chip.sdf", u_mac);
*/


initial begin
/*  result_file1 = $fopen("mac_rst.txt"); */
/*    result_file2 = $fopen("EXPECT.DAT");    */
  dump_vcd;
  #0 
  clk = 1; 
  reset_n = 1; 
  stall = 1'b0;
  multiplier = 16'bz;
  multiplicand = 16'bz;
  instruction = 3'bz;
  error_cnt = 0;
  ready     = 0;
  $display("start test");
  #(`HPHASE)
     reset_n = 0;
  #(`CYCLE-0.1)  // to prevent from race condition by ccyang
     reset_n = 1;
     test_mac_16;
     test_mac_8;
  #(3* `CYCLE)
     $finish;
end

task test_mac_8;
  begin
  //********************
  mac_tsk(CLEAR, NO_STALL, 16'hff11, 16'h11ff, 0, 0);  

  $display("------------------------------");
  $display("b1. test MUL_8, cycle = %h", cycle_cnt);
  mac_tsk(MUL_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MUL_8, NO_STALL, 16'h8080, 16'h8080, protect_g, result_g);  
  mac_tsk(MUL_8, NO_STALL, 16'h7f7f, 16'h8080, protect_g, result_g);  
  mac_tsk(MUL_8, NO_STALL, 16'h3031, 16'h232f, protect_g, result_g);  
  
  $display("------------------------------");
  $display("b2. test MAC_8, overflow, cycle = %h", cycle_cnt);
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  

  mac_tsk(SAT_8, NO_STALL, 16'h8080, 16'h8080, protect_g, result_g);  

  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h7f7f, 16'h7f7f, protect_g, result_g);  

  $display("------------------------------");
  $display("b3. test stall, cycle = %h", cycle_cnt);
  mac_tsk(SAT_8,    STALL,    16'h8080, 16'h8080, protect_g, result_g);  
  mac_tsk(SAT_8,    NO_STALL, 16'h8080, 16'h8080, protect_g, result_g);  
  
  $display("------------------------------");
  $display("b4. test SAT_8, cycle = %h", cycle_cnt);
  mac_tsk(SAT_8, NO_STALL, 16'h8080, 16'h8080, protect_g, result_g);  
  mac_tsk(CLEAR, NO_STALL, 16'hff11, 16'h11ff, protect_g, result_g);  

  $display("------------------------------");
  $display("b5. test MAC_8, cycle = %h", cycle_cnt);
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  

  mac_tsk(SAT_8, NO_STALL, 16'h807f, 16'h8080, protect_g, result_g);  

  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h807f, 16'h7f7f, protect_g, result_g);  

  $display("------------------------------");
  $display("b6. stall insertion, cycle = %h", cycle_cnt);
  mac_tsk(SAT_8,    STALL, 16'h8080, 16'h8080, protect_g, result_g);  
  mac_tsk(SAT_8,    STALL, 16'h8080, 16'h8080, protect_g, result_g);  
  mac_tsk(SAT_8, NO_STALL, 16'h8080, 16'h8080, protect_g, result_g);  
  mac_tsk(SAT_8, NO_STALL, 16'h8080, 16'h8080, protect_g, result_g);  
  mac_tsk(MAC_8, NO_STALL, 16'h8080, 16'h7f7f, protect_g, result_g);  
  
  $display("b7. test stall, cycle = %h", cycle_cnt);
  mac_tsk(SAT_8,      STALL, 16'h8080, 16'h8080, protect_g, result_g);  
  mac_tsk(SAT_8,   NO_STALL, 16'h8080, 16'h8080, protect_g, result_g);  

  $display("b8. test SAT_8, cycle = %h", cycle_cnt);
  mac_tsk(SAT_8, NO_STALL, 16'h8080, 16'h8080, protect_g, result_g); 
  mac_tsk(CLEAR, NO_STALL, 16'hff11, 16'h11ff, protect_g, result_g);  

  //********************
  end
endtask

task test_mac_16;
  begin
  //********************
  mac_tsk(CLEAR, NO_STALL, 16'hff11, 16'h11ff, 0, 0);  

  $display("------------------------------");
  $display("a1. test MUL_16, cycle = %h", cycle_cnt);
  mac_tsk(MUL_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MUL_16, NO_STALL, 16'h8000, 16'h8000, protect_g, result_g);  
  mac_tsk(MUL_16, NO_STALL, 16'h7fff, 16'h8000, protect_g, result_g);  
  mac_tsk(MUL_16, NO_STALL, 16'h3031, 16'h232f, protect_g, result_g);  
  
  $display("------------------------------");
  $display("a2. test MAC_16, overflow, cycle = %h", cycle_cnt);
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  

  mac_tsk(SAT_16, NO_STALL, 16'h8000, 16'h8000, protect_g, result_g);  

  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h7fff, 16'h7fff, protect_g, result_g);  

  $display("------------------------------");
  $display("a3. test stall, cycle = %h", cycle_cnt);
  mac_tsk(SAT_16,    STALL, 16'h8000, 16'h8000, protect_g, result_g);  
  mac_tsk(SAT_16, NO_STALL, 16'h8000, 16'h8000, protect_g, result_g);  
  
  $display("------------------------------");
  $display("a4. test SAT_16, cycle = %h", cycle_cnt);
  mac_tsk(SAT_16, NO_STALL, 16'h8000, 16'h8000, protect_g, result_g);  
  mac_tsk(CLEAR,  NO_STALL, 16'hff11, 16'h11ff, protect_g, result_g);  

  $display("------------------------------");
  $display("a5. test MAC_16, cycle = %h", cycle_cnt);
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  

  mac_tsk(SAT_16, NO_STALL, 16'h8000, 16'h8000, protect_g, result_g);  

  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  

  $display("------------------------------");
  $display("a6. stall insertion, cycle = %h", cycle_cnt);
  mac_tsk(SAT_16,    STALL, 16'h8000, 16'h8000, protect_g, result_g);  
  mac_tsk(SAT_16,    STALL, 16'h8000, 16'h8000, protect_g, result_g);  
  mac_tsk(SAT_16, NO_STALL, 16'h8000, 16'h8000, protect_g, result_g);  
  mac_tsk(SAT_16,    STALL, 16'h8000, 16'h8000, protect_g, result_g);  
  mac_tsk(MAC_16, NO_STALL, 16'h8000, 16'h7fff, protect_g, result_g);  
  
  $display("a7. test stall, cycle = %h", cycle_cnt);
  mac_tsk(SAT_16,    STALL, 16'h8000, 16'h8000, protect_g, result_g);  

  $display("a8. test SAT_16, cycle = %h", cycle_cnt);
  mac_tsk(SAT_16, NO_STALL, 16'h8000, 16'h8000, protect_g, result_g); 
  mac_tsk(CLEAR,  NO_STALL, 16'hff11, 16'h11ff, protect_g, result_g);  

  //********************
  
  end
endtask

task mac_tsk;
  input [2:0] instruction_t;
  input stall_t;
  input [15:0] a;
  input [15:0] b;
  
  input [7:0] protect_t; //unused, for on-line verification
  input [31:0] result_t; //unused, for on-line verification
  
  begin
    @(negedge clk)
    #(`CYCLE*0.3)
      instruction = instruction_t;
      multiplier = a;
      multiplicand = b;
      stall = stall_t; 
      protect_g = protect_t;
      result_g = result_t;
    #(`CYCLE*0.4)
      instruction = 3'bz;
      multiplier = 16'bz;
      multiplicand = 16'bz;
      stall = 1'b0;
      protect_g = protect_t;
      result_g = result_t;  
  end
endtask  

//*********************
//compare result
//*********************
always @(negedge clk) begin
//  $fdisplay(result_file1,"cycles = %h,  %h,  %h", cycle_cnt, protect, result);
//    $fdisplay(result_file2,"%h%h", protect, result);
  end

//*********************
// Dump waveform
//*********************

task dump_vcd;
begin
//$dumpfile("mac.vcd");
//$dumpvars;    
`ifdef FSDB
  //$fsdbVersion;
  $fsdbDumpfile(`DUMPFILE_NAME);
  $fsdbDumpvars;
`endif
 end
endtask

endmodule // module_name

// ============================ End of Module ==================================
// Revision History
// $Log: dic_2003.v,v $
// Revision 1.1  2003/04/25 04:01:19  ip01_11a
// for ic test
//
// Revision 1.1.1.1  2003/04/15 03:30:42  ip01_11a
// first version
//
