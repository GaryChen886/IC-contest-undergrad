module avg(din, reset, clk, ready, dout);
input reset, clk;
input [15:0] din;
output reg ready;
output reg [15:0] dout;

// ==========================================
//  Enter your design below
// ==========================================

reg [15:0] mem [11:0] ;
reg [20:0] sum;
reg [3:0] i;
reg [3:0] j;
reg [15:0] avg;
reg [15:0] arrp;
reg [3:0] count;

        always@(posedge clk or posedge reset)begin
                if(reset)begin
                        for(i = 0;i<12;i = i+1)
                                mem[i] <= 0;
                        sum <= 0;
                        i <= 0;
                        ready <= 0;
                        count <= 0;
                end
                else begin
                        for(i = 11;i>0;i = i-1)
                                mem[i] <= mem[i-1];
                        mem[0] <= din;
                        sum <= sum - mem[11] + din;
                        if(ready == 0)begin
                                count = count +1;
                                if(count == 11)
                                        ready = 1;
                        end
                        else
                                ready = 1;
                        end
        end
        always @(*) begin
                if(ready == 1)begin
                                avg = sum/12;
                                arrp = mem[0];
                        for(j = 0;j<12;j = j+1)begin
                                if(((avg >= mem[j])?avg-mem[j]:mem[j]-avg) < ((avg >= arrp)?avg-arrp:arrp-avg))
                                        arrp = mem[j];
                                else if(((avg >= mem[j])?avg-mem[j]:mem[j]-avg) == ((avg >= arrp)?avg-arrp:arrp-avg) && arrp >= mem[j])
                                        arrp = mem[j];
                                else
                                        arrp = arrp;
                        end
                        dout = arrp;
                end
        end

endmodule
