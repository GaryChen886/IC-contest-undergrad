module JAM (
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output reg Valid );
    
    
    //2 ^ 16 
    reg [15:0]round;//*****************************
    reg [2:0]p[0:7];
    reg [2:0]index, min,k,j;
    reg [3:0] sum;
    reg [2:0]state_current, state_next; //********************
    reg next_sort;
    reg next_CAL;
    reg next_part;
    reg [3:0]counter;
    
    parameter IDLE = 3'd0;
    parameter SORT = 3'd1;  
    parameter ALLOCATE = 3'd2;
    parameter PART = 3'd3;
    parameter WHOLE = 3'd4;
    parameter CAL = 3'd5;
    parameter COMPARE = 3'd6;
    parameter DONE = 3'd7;
    
    always @(posedge CLK or posedge RST)begin
        if(RST)begin
            state_current <= IDLE;
        end
        else begin
            state_current <= state_next;
        end
    end
    
    always @(*)begin
        state_next = IDLE;
        case(state_current)
            IDLE : state_next = SORT;
            SORT : begin
                if(next_sort) state_next = ALLOCATE;
                else state_next = SORT;
            end
            ALLOCATE : begin
                if(next_part) state_next=PART;
                else state_next=ALLOCATE;
            end
            PART : state_next = WHOLE;
            WHOLE : begin 
                if(next_CAL) state_next=CAL;
                else state_next= WHOLE;
            end
            CAL : begin 
                if(counter== 8) state_next = COMPARE; 
                else state_next = CAL;
            end
            COMPARE : begin
                if(round == 16'd40318) state_next = DONE;
                else state_next = IDLE;
            end
            DONE : state_next = DONE;
        endcase
    end
    
    
    always @(posedge CLK or posedge RST)begin   // next_sort
        if(RST)begin            
            next_sort <= 0;
        end else begin
            if(state_current==SORT) begin
                if(p[index]>p[index-1])
                    next_sort <= 1;
            end else if(state_current == IDLE)begin
                next_sort <= 0;
            end
        end
    end

    always @(posedge CLK or posedge RST)begin   // sum
        if(RST)begin
            sum <= 0;
        end
        else begin
            if(state_current==SORT) begin
                if(p[index]>p[index-1]) begin
                    sum<= index+7;
                end
            end
        end
    end
    
    always @(posedge CLK or posedge RST)begin   // index
        if(RST)begin
            index <= 7;
        end
        else begin
            if(state_current == SORT) begin
                if(p[index] <= p[index-1])
                    index <= index-1;
            end else if(state_current == IDLE)begin
                index <= 3'd7;
            end else if(state_current == WHOLE) begin
                if(k > index)
                    index <= index+1;
            end
        end
    end
    
    always @(posedge CLK or posedge RST)begin   //ALLOCATE, next_part, min, j
        if(RST)begin
           j  <= 3'd7;
           min <= 3'd0;
           next_part<=0;
        end
        else begin
            if(state_current==ALLOCATE) begin
                if(p[j]>p[index-1]) begin
                    min<=j;
                    next_part<=1;
                end
                else j<=j-1;
            end
            else if(state_current == IDLE)begin
                j  <= 3'd7;
                min <= 3'd0;
                next_part<=0;
            end
        end
    end
    
    always @(posedge CLK or posedge RST)begin   // p 
        if(RST)begin
            p[0] <= 3'd0;
            p[1] <= 3'd1;
            p[2] <= 3'd2;
            p[3] <= 3'd3;
            p[4] <= 3'd4;
            p[5] <= 3'd5;
            p[6] <= 3'd6;
            p[7] <= 3'd7;
        end else begin
            if(state_current==PART) begin
                p[index-1]<=p[min];
                p[min]<=p[index-1];
            end else if(state_current==WHOLE) begin
                if(k>index) begin
                    p[k]<=p[index];
                    p[index]<=p[k];
                end
            end
        end
    end
    
    always @(posedge CLK or posedge RST)begin   //WHOLE: k, next_CAL
        if(RST)begin
           k<=3'd7;
           next_CAL<=0;
        end
        else begin
            if(state_current==WHOLE) begin
                if(k>index) begin
                    k<=k-1;
                end
                else next_CAL <=1;
            end
            else if(state_current==IDLE) begin
                 k<=3'd7;
                 next_CAL<=0;                
            end
        end
    end
    
    reg [9:0]result;
    always @(posedge CLK or posedge RST)begin   //CAL: result
        if(RST) 
            result <= 0;
        else begin
            if(state_current==CAL) begin
                if(counter >= 1 && counter <= 8) begin
                    result <= result + Cost;
                end
            end else if(state_current == IDLE) begin
                result <= 0;
            end
        end
    end
    
    always @(posedge CLK or posedge RST)begin   //CAL
        if(RST)begin
            counter <= 0;
            //Cost <= 0;
            W <= 0;
            J <= 0;
        end
        else begin
            if(state_current==CAL) begin
                case(counter)
                    0 : begin
                        W <= p[0];
                        J <= 0;
                        //Cost <= Cost;
                    end
                    1 : begin
                        W <= p[1];
                        J <= 1;
                        //Cost <= Cost;
                    end
                    2 : begin
                        W <= p[2];
                        J <= 2;
                        //Cost <= Cost;
                    end
                    3 : begin
                        W <= p[3];
                        J <= 3;
                        //Cost <= Cost;
                    end
                    4 : begin
                        W <= p[4];
                        J <= 4;
                        //Cost <= Cost;
                    end
                    5 : begin
                        W <= p[5];
                        J <= 5;
                        //Cost <= Cost;
                    end
                    6 : begin
                        W <= p[6];
                        J <= 6;
                        //Cost <= Cost;
                    end
                    7 : begin
                        W <= p[7];
                        J <= 7;
                        //Cost <= Cost;
                    end
                endcase
                
                if(counter <= 7) counter <= counter + 1;
                else counter <= 0;
            end
            /*
            else if(state_current != CAL && state_current != COMPARE) begin
                result <= 0;
                //Cost <= 0;
            end
            */
        end
    end
    
    reg [9:0]tmp;
    
    always @(posedge CLK or posedge RST)begin   //COMPARE
        if(RST)begin
            MatchCount <= 1;
            MinCost <= 10'd1023;
            round<=0;
        end
        else begin
            if(state_current==COMPARE) begin
                if(result < MinCost)    begin
                    MatchCount <= 1;
                    MinCost <= result;
                    round<=round+1;
                end
                else if(result == MinCost) begin 
                    MatchCount <= MatchCount + 1;
                    round<=round+1;
                end
                else begin
                    round<=round+1;
                end
            end
        end
    end
    
    always @(*) begin
        Valid = 0;
        if(state_current == DONE)begin
            Valid = 1;
        end
    end

endmodule
