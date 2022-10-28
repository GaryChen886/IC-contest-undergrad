module S1(clk, rst, RB1_RW, RB1_A, RB1_D, RB1_Q, sen, sd);

    input clk, rst;
    output RB1_RW;      
    output reg [4:0] RB1_A; 
    output [7:0] RB1_D; 
    input [7:0] RB1_Q;  
    output reg sen, sd;

    reg [1:0] currentState,nextState;

    reg [1:0] counterAddrBit;
    reg [2:0] counterDataBit;
    reg [2:0] counterPak;

    assign RB1_RW = 1'b1;
    assign RB1_D = 8'b0;
    
    /*
    FSM
    */
    parameter IDLE = 2'd0;
    parameter RB_READ = 2'd1;
    parameter INPUT_DATA = 2'd2;
    parameter FINISH = 2'd3;
    always @(negedge clk or posedge rst) begin
        if(rst)                                     currentState <= IDLE;
        else                                        currentState <= nextState;
    end
    always @(*)begin
        case (currentState)
            IDLE :                                  nextState = RB_READ;
            RB_READ : begin
                if(counterAddrBit == 2'd0)          nextState = INPUT_DATA;
                else                                nextState = RB_READ;
            end 
            INPUT_DATA : begin
                if(RB1_A == 5'd0)                   nextState = FINISH;
                else                                nextState = INPUT_DATA;
            end 
            FINISH : begin
                if(counterPak == 3'd7)              nextState = IDLE;
                else                                nextState = RB_READ;
            end 
        endcase
    end

    /*
    RB1_A   address of Register Bank1
    */
    always @(negedge clk or posedge rst) begin
        if(rst)begin
            RB1_A <= 5'd0;
        end
        else begin
            if(currentState == RB_READ)             RB1_A <= 5'd17;
            else if(currentState == INPUT_DATA)     RB1_A <= RB1_A - 1;
        end 
    end
    
    
    /*
    counterAddrBit  counter for 3-bit address of in the front of packet
    in order to mark the bit being transferred right now
    */
    always @(negedge clk or posedge rst) begin
        if(rst)                                     counterAddrBit <= 2'd2;
        else begin
            if(currentState == RB_READ)             counterAddrBit <= counterAddrBit - 1;
            else if(currentState == FINISH)         counterAddrBit <= 2'd2;
        end
    end
  
    /*
    counterDataBit  counter for the rest 7-bit data     
    */
    always @(negedge clk or posedge rst) begin
        if(rst)                                     counterDataBit <= 3'd7;
        else begin
            if(currentState == FINISH)              counterDataBit <= counterDataBit - 1;
        end
    end
    
    /*
    counter for packet
    */
    always @(negedge clk or posedge rst) begin
        if(rst)                                     counterPak <= 0;
        else begin
            if(currentState == FINISH)              counterPak <= counterPak + 1;
            else if(currentState == IDLE)           counterPak <= 0;
        end
    end
    
    /*
    sen
    */
    always @(negedge clk or posedge rst)begin
        if(rst)begin
            sen <= 1;
        end
        else begin
            if(currentState == RB_READ)             sen <= 0;
            else if(currentState == INPUT_DATA)     sen <= 0;
            else                                    sen <= 1;
        end
    end
    
    /*
    sd
    */
    always @(negedge clk or posedge rst) begin
        if(rst)                                     sd <= 0;
        else begin
            if(currentState == RB_READ)             sd <= counterPak[counterAddrBit];
            else if(currentState == INPUT_DATA)     sd <= RB1_Q[counterDataBit];
        end
    end

endmodule
