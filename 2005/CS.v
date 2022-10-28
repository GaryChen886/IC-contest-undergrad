module CS(Y, X, reset, clk);
    input clk, reset; 
    input 	[7:0] X;
    output reg [9:0] Y;
    //--------------------------------------
    //  \^o^/   Write your code here~  \^o^/
    //--------------------------------------

    reg [7:0] X_Series[8:0];   
    reg [10:0] sum;

    generate
        genvar i;
        always @(posedge clk or posedge reset)begin
            if(reset)begin
                for(i=0;i<9;i=i+1)begin
                    X_Series[i]<=0;
                end
                sum<=0;
            end
            else begin
                for(i=8;i>0;i=i-1)
                    X_Series[i]<=X_Series[i-1];
                X_Series[0]<=X;
                sum<=sum-X_Series[8]+X;
            end
            
        end
    endgenerate

    genvar j;
    reg [8:0] Xappr;
    generate
        always @(*)begin
            Xappr=0;
            for(j=0;j<9;j=j+1)begin
                if((X_Series[j]<=sum/9)&&(X_Series[j]>Xappr))  
                    Xappr=X_Series[j];
            end
            Y=(sum+({Xappr,3'b0}+Xappr))>>3;
        end
    endgenerate
endmodule
