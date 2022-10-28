`timescale 1ns/10ps
`define CYCLE  10        	// Modify your clock period here

`define INFILE "in.dat"
`define OUTFILE "out_golden.dat"  

module test;
parameter INPUT_DATA = `INFILE;
parameter GOLDEN = `OUTFILE;
parameter N_PAT = 2000;
parameter t_reset = `CYCLE*2;

reg reset;
reg clk;
reg ready;
reg stop;
reg flag1, flag2;
wire pclk = clk ;

integer i, out_f, err, pattern_num;
integer a, b;
reg     [7:0] X;
reg 	[7:0] data_base1 [0:20000];
reg	[9:0] data_base2 [0:20000];
reg 	[9:0] data_tmp;
wire    [9:0] Y; 

CS top (.Y(Y), .X(X), .reset(reset), .clk(clk)); 

initial	$readmemh (INPUT_DATA, data_base1);

initial $readmemh (GOLDEN, data_base2);

initial begin
   reset = 1'b0;
   clk = 1'b1;
   stop = 1'b0;
   err = 0;
   a = 0;
   b = 0;
   pattern_num = 0 ;     
end

initial begin
    $fsdbDumpfile("HW3.fsdb");
    $fsdbDumpvars("+struct","+mda",top);
end

initial begin
//$dumpfile("cs.vcd");
//$dumpvars;
//$fsdbDumpfile("cs.fsdb");
//$fsdbDumpvars; 

   out_f = $fopen("out.dat");
   if (out_f == 0) begin
        $display("Output file open error !");
        $finish;
   end
end

always begin #(`CYCLE/2) clk = ~clk;
end


specify
$setup(Y, posedge pclk, 0.5, flag1);
$hold(posedge pclk, Y, 0.5, flag2); 
endspecify 

always @(flag1)
   if(flag1 == 1'b1 || flag1 == 1'b0)
     a = a +1;

always @(flag2)
   if(flag2 == 1'b1  || flag2 == 1'b0)
     b = b +1;


initial 
  begin
    X = data_base1[0] ;
    @(negedge clk) reset = 1'b1;
    #t_reset reset = 1'b0;  ready = 1'b0;
    #`CYCLE
    for (i = 1; i < N_PAT; i = i + 1) 
    begin
      @(negedge clk) X = data_base1[i]; 
      if (i==8)
        @(posedge clk) ready = 1'b1;                      
    end 
  end  
 		
always @(posedge clk) 
  begin
   if (pattern_num + 9 > N_PAT)      stop = 1 ;
   else if (ready) 
     begin
       data_tmp = data_base2[pattern_num]; 
       $fdisplay(out_f,"%h", Y); 
         if (Y !== data_tmp) 
           begin
             $display("ERROR at %d:output %h !=expect %h ",pattern_num, Y, data_tmp);
             err = err + 1 ;
           end
       pattern_num = pattern_num + 1 ; 
     end

  end  

initial begin
      @(posedge stop)
      $display("---------------------------------------------\n");
      if (a !=0)
         $display("There are %d setup time violations by Y\n", a);
      if (b !=0)
         $display("There are %d hold time violations by Y\n", b);
      $display("---------------------------------------------\n");
      if (err == 0)
        begin
          $display("All data have been generated successfully!\n");
          $display("-------------------PASS-------------------\n");
        end
      else 
         $display("There are %d errors!\n", err);
      $display("---------------------------------------------\n");
      $finish;
   end
endmodule
