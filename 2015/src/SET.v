`define abs(a,b) ((a>b)? a-b : b-a )    //if a>b -> distance = a-b
module SET ( clk , rst, en, central, radius, mode, busy, valid, candidate );

    input clk, rst;
    input en;
    input [23:0] central;
    input [11:0] radius;
    input [1:0] mode;
    output reg busy;
    output reg valid;
    output reg [7:0] candidate;
    wire [7:0] circle1,circle2,circle3;
    wire [7:0] Rsquare1,Rsquare2,Rsquare3;
    wire cnt1,cnt2,cnt3;
    reg [3:0] x [3:1];
    reg [3:0] y [3:1];
    reg [3:0] r [3:1];
    reg [3:0] cur_x,cur_y;
    
    //data flow description
    assign circle1 = ( `abs(cur_x,x[1]) * `abs(cur_x,x[1]) ) + ( `abs(cur_y,y[1]) * `abs(cur_y,y[1]) );
    assign circle2 = ( `abs(cur_x,x[2]) * `abs(cur_x,x[2]) ) + ( `abs(cur_y,y[2]) * `abs(cur_y,y[2]) );
    assign circle3 = ( `abs(cur_x,x[3]) * `abs(cur_x,x[3]) ) + ( `abs(cur_y,y[3]) * `abs(cur_y,y[3]) );
    assign Rsquare1 = r[1] * r[1];  //rsquare
    assign Rsquare2 = r[2] * r[2];
    assign Rsquare3 = r[3] * r[3];
    assign cnt1 = ( circle1 > Rsquare1 ) ? 1'b0 : 1'b1 ;    //if circle1(x^2 + y^2) > r^2 -> cnt1 = 1
    assign cnt2 = ( circle2 > Rsquare2 ) ? 1'b0 : 1'b1 ;
    assign cnt3 = ( circle3 > Rsquare3 ) ? 1'b0 : 1'b1 ;

    always@(posedge clk or posedge rst)begin
        if(rst)begin
            busy <= 1'b0;
            valid <= 1'b0;
            candidate <= 8'd0;
            cur_x <= 4'd0;
            cur_y <= 4'd0;
        end
        
        else begin
            if (en)begin
                busy <= 1'b1;
                valid <= 1'b0;
                candidate <= 8'd0;
                x[1] <= central[23:20];
                x[2] <= central[15:12];
                x[3] <= central[7:4];
                y[1] <= central[19:16];
                y[2] <= central[11:8];
                y[3] <= central[3:0];
                r[1] <= radius[11:8];
                r[2] <= radius[7:4];
                r[3] <= radius[3:0];
                cur_x <= 4'd1;
                cur_y <= 4'd1;
            end
        
            if (busy)begin
                if (valid)
                    busy <= 1'b0;
                else begin
                    case(mode)
                        2'd0:begin
                            if(cur_x <= 8)begin
                                if(cur_y <= 8)begin
                                    candidate <= candidate + cnt1;
                                    cur_y <= cur_y + 1;
                                end
                                else begin
                                    cur_x <= cur_x+1;
                                    cur_y <= 4'd1;
                                end
                            end
                            else begin
                                valid <= 1'b1;
                            end
                        end
                
                        2'd1:begin
                            if( cur_x <= 8 )begin
                                if(cur_y <= 8)begin
                                    if(cnt1 == 1 && cnt2 == 1)begin
                                        candidate <= candidate + 1;
                                    end
                                    else;
                                    cur_y <= cur_y+1;
                                end
                                else begin
                                    cur_x <= cur_x+1;
                                    cur_y <= 4'd1;
                                end
                            end
                            else begin
                                valid <= 1'b1;
                            end
                        end
                        
                        2'd2:begin
                            if(cur_x <= 8)begin
                                if(cur_y <= 8)begin
                                    if(cnt1 == 1 && cnt2 == 0)begin
                                        candidate <= candidate + 1;
                                    end
                                    else if(cnt1 == 0 && cnt2 == 1)begin
                                        candidate <= candidate + 1;
                                    end
                                    else;
                                    cur_y <= cur_y + 1;
                                end
                                else begin
                                    cur_x <= cur_x + 1;
                                    cur_y <= 4'd1;
                                end
                            end
                            else begin
                                valid <= 1'b1;
                            end
                        end
                        
                        2'd3:begin
                            if(cur_x <= 8)begin
                                if(cur_y <= 8)begin
                                    if(cnt1 == 1 && cnt2 == 1 && cnt3 == 0)begin
                                        candidate <= candidate + 1;
                                    end
                                    else if(cnt1 == 0 && cnt2 == 1 && cnt3 == 1)begin
                                        candidate <= candidate + 1;
                                    end
                                    else if(cnt1 == 1 && cnt2 == 0 && cnt3 == 1)begin
                                        candidate <= candidate + 1;
                                    end 
                                    else;
                                    cur_y <= cur_y+1;
                                end
                                else begin
                                    cur_x <= cur_x+1;
                                    cur_y <= 4'd1;
                                end
                            end
                
                            else begin
                                valid <= 1'b1;
                            end
                        end
                    endcase
                end
            end
        end
    end
endmodule
