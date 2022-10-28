module S2(clk, rst, S2_done, RB2_RW, RB2_A, RB2_D, RB2_Q, sen, sd);

    input clk, rst;
    output reg S2_done; 
    output reg RB2_RW;
    output reg [2:0] RB2_A;
    output reg [17:0] RB2_D;
    input [17:0] RB2_Q;
    input sen, sd;

    reg [1:0] currentState, nextState;
    reg [1:0] counterBitAddress;
    reg [4:0] counterData;
    reg [2:0] counterPacket;

    parameter IDLE          = 2'd0;
    parameter RB2_RDWR      = 2'd1;
    parameter INPUT_DATA    = 2'd2;
    parameter FINISH        = 2'd3;

    /*
    FSM
    */
    always @(posedge clk or posedge rst) begin
        if(rst)                             currentState <= IDLE;
        else                                currentState <= nextState;
    end
    always @(*) begin
        case(currentState)
            IDLE :                          nextState = RB2_RDWR;
            RB2_RDWR : begin
                if(counterBitAddress == 0)  nextState = INPUT_DATA;
                else                        nextState = RB2_RDWR;
            end
            INPUT_DATA : begin
                if(counterData == 0)        nextState = FINISH;
                else                        nextState = INPUT_DATA;
            end
            FINISH : begin
                if(counterPacket == 3'd7)   nextState = IDLE;
                else                        nextState = RB2_RDWR;
            end
        endcase
    end
    
    /*
    RB2 Read & Write signal
    RW = low -> Write
    */
    always @(posedge clk or posedge rst) begin
        if(rst)                             RB2_RW <= 1;
        else if(currentState == INPUT_DATA) RB2_RW <= 0;    //write
        else                                RB2_RW <= 1;
    end
    /*
    RB2 Address
    */
    always @(posedge clk or posedge rst) begin
        if(rst)                             RB2_A <= 0;
        else begin
                                            RB2_A[counterBitAddress] <= (currentState == RB2_RDWR) ? sd : RB2_A[counterBitAddress];
        end
    end
    /*
    Address Bit counter (3 -> 0)
    */
    always @(posedge clk or posedge rst) begin
        if(rst)                             counterBitAddress <= 2'd2;
        else begin
                                            counterBitAddress <= (currentState == RB2_RDWR) ? counterBitAddress - 1 : 2'd2;
        end
    end
    
    
    /*
    RB2_D
    */
    always @(posedge clk or posedge rst) begin
        if(rst)                             RB2_D <= 0;
        else                                RB2_D[counterData] <= (currentState == INPUT_DATA) ? sd : RB2_D[counterData];
    end
    /*
    Data Bit counter (17 -> 0)
    */
    always @(posedge clk or posedge rst) begin
        if(rst)                             counterData <= 5'd17;
        else begin
                                            counterData <= (currentState == INPUT_DATA) ? counterData - 1 : 5'd17;
        end
    end
    
    
    /*
    Packet counter
    */
    always @(posedge clk or posedge rst) begin
        if(rst)                             counterPacket <= 0;
        else begin
                                            counterPacket <= (currentState == FINISH) ? counterPacket + 1 : counterPacket;
        end
    end
    /*
    S2_done
    */
    always @(posedge clk or posedge rst) begin
        if(rst)                             S2_done <= 0;
        else                                S2_done <= (counterPacket == 3'd7 && currentState == FINISH) ? 1 : 0;
    end
    
endmodule
