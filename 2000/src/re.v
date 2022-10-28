module CS(Y, X, reset, clk);
input clk, reset;
input   [7:0] X;
output reg [9:0] Y;

reg [7:0] X_Series[8:0];   //X serious (8bits*9)
reg [10:0] sum;
reg [3:0] i;

// store the nine input Xs and calculate the sum of them
always@(posedge clk or posedge reset)begin
        if(reset)begin
                for(i=0;i<9;i=i+1)
                        X_Series[i]<=0;
                sum<=0;
                i <= 0;
        end
        else begin

                for(i=8;i>0;i=i-1)
                        X_Series[i]<=X_Series[i-1];
                /*
                // The above 'for loop' is equivalent to codes in this comment
                X_Series[8]<=X_Series[7];
                X_Series[7]<=X_Series[6];
                X_Series[6]<=X_Series[5];
                X_Series[5]<=X_Series[4];
                X_Series[4]<=X_Series[3];
                X_Series[3]<=X_Series[2];
                X_Series[2]<=X_Series[1];
                X_Series[1]<=X_Series[0];
                */
                X_Series[0]<=X;
                sum<=sum-X_Series[8]+X;
        end

end


reg [3:0] j;
reg [8:0] Xappr;
always @(*)begin
	Xappr=0;
        for(j=0;j<9;j=j+1)begin        //Find out Xappr
                if((X_Series[j]<=sum/9)&&(X_Series[j]>Xappr))
                        Xappr=X_Series[j];
        end
        /*
        // The above 'for loop' is equivalent to codes in this comment
        if((X_Series[0]<=sum/9)&&(X_Series[0]>Xappr))
                Xappr=X_Series[0];
        if((X_Series[1]<=sum/9)&&(X_Series[1]>Xappr))
                Xappr=X_Series[1];
        if((X_Series[2]<=sum/9)&&(X_Series[2]>Xappr))
                Xappr=X_Series[2];
        if((X_Series[3]<=sum/9)&&(X_Series[3]>Xappr))
                Xappr=X_Series[4];
        if((X_Series[4]<=sum/9)&&(X_Series[4]>Xappr))
                Xappr=X_Series[4];
        if((X_Series[5]<=sum/9)&&(X_Series[5]>Xappr))
                Xappr=X_Series[5];
        if((X_Series[6]<=sum/9)&&(X_Series[6]>Xappr))
                Xappr=X_Series[6];
        if((X_Series[7]<=sum/9)&&(X_Series[7]>Xappr))
                Xappr=X_Series[7];
        if((X_Series[8]<=sum/9)&&(X_Series[8]>Xappr))
                Xappr=X_Series[8];*/


        // {Xappr,3'b0} is equivalent to Xappr<<3, but Xappr<<3 might overflow if you declare Xappr only 11bits
        Y=(sum+({Xappr,3'b0}+Xappr))>>3;
end
endmodule
