// ==============================================================
//   Modify the definition of HALF_CYCLE to change clock period
//   clock period = HALF_CYCLE * 2
// ==============================================================  
`timescale 1ns/10ps
`define HALF_CYCLE 10.0
`define CYCLE `HALF_CYCLE*2.0
`define THOLD 2.0
`define TDELAY 2.5
`define N_PAT 2000

module test;
wire ready;
wire [15:0] dout;
reg clk, reset;
reg [15:0] din;
reg [15:0] pat[0:`N_PAT*2-1];
integer i, j, out_f, err;


initial begin
  $fsdbDumpfile("avg.fsdb");
  $fsdbDumpvars("+struct", "+mda", test);
end


avg top (.din(din), .reset(reset), .clk(clk), .ready(ready), .dout(dout));


// ========================================================
//   Annotate the sdf file at gate-level simulation
//   avg.timing is the default sdf file, if your sdf file
//   name is not avg.timing, replace it by your file name 
// ========================================================

//initial $sdf_annotate("avg.timing", top);


initial $readmemh("IN.DAT", pat);
initial begin
   reset <= 1'b0;
   clk <= 1'b1;
   din <= pat[0];
   j <= 0;
   err <= 0;
end

initial begin
   out_f = $fopen("OUT.DAT");
   if (out_f == 0) begin
        $display("Output file open error !");
        $finish;
   end
end

always #(`HALF_CYCLE) clk = ~clk;

initial begin
   #(`HALF_CYCLE)      reset = 1'b1;
   #(`CYCLE*2)        reset = 1'b0;
   #(`HALF_CYCLE+`THOLD) 
   for  (i = 1; i < `N_PAT; i = i + 1) begin
      din = pat[i];
      #(`CYCLE);
   end
   #(`CYCLE*10);
   $finish;
end

always @ (posedge clk) begin
   if (ready) begin
      #`TDELAY;
      $fdisplay(out_f,"%d",dout);
      $display("%d :  %d", j, dout);
      if ( dout !== pat[`N_PAT+j]) begin
         $display("ERROR at %d : output %d != expect %d", j, dout, pat[`N_PAT+j]);
         err = err + 1;
      end
      j = j + 1;
   end
   if (j >= `N_PAT-12 ) begin
      $display("---------------------------------------------");
      if (err == 0)
         $display("All data have been generated successfully!");
      else
         $display("There are %d errors!", err);
      $display("---------------------------------------------");
      $finish;
   end
end

//initial begin
//   $shm_open("shm/shm.db");
//   $shm_probe("AS");
//end
endmodule
