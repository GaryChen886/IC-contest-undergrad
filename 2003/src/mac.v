module mac (instruction, multiplier, multiplicand, stall, clk, reset_n, result, protect);
    input signed [15:0] multiplier;
    input signed [15:0] multiplicand; 
    input  clk;
    input  reset_n;
    input  stall;
    input  [2:0] instruction;
    output reg [31:0] result;
    output reg [7:0] protect;

    //Add you design here

    reg signed [15:0] multip, mulcand; 
    reg [2:0] ins1, ins2; 
    reg [39:0] tmp16;
    reg [19:0] tmp8_1, tmp8_2;
    wire [7:0] mul_1, mul_2; 
    wire [7:0] mulc_1, mulc_2;
    assign {mul_1[7:0], mul_2[7:0]} = multip[15:0];
    assign {mulc_1[7:0], mulc_2[7:0]} = mulcand[15:0];
    always @(posedge clk) begin
        if (!reset_n) begin
            multip <= 0;
            mulcand <= 0;
            ins1 <= 0;
            ins2 <= 0;
        end 
        else begin
            if (!stall) begin
                multip <= multiplier;
                mulcand <= multiplicand;
                ins1 <= instruction;
                ins2 <= ins1;
            end
        end
    end
    always @(posedge clk) begin
        if (!reset_n) begin
            tmp16 <= 40'd0;
            tmp8_2 <= 20'd0;
            tmp8_1 <= 20'd0;
        end else begin
            if (!stall) begin
                case (ins1)
                    3'b000: begin
                        tmp16 <= 40'd0;
                        tmp8_2 <= 20'd0; 
                        tmp8_1 <= 20'd0;
                    end 

                    3'b001: begin
                        tmp16 <= {{24{multip[15]}}, multip} * {{24{mulcand[15]}}, mulcand};
                    end
                    
                    3'b010: begin
                        tmp16 <= tmp16 + {{24{multip[15]}}, multip} * {{24{mulcand[15]}}, mulcand};
                    end
                    3'b011: begin
                        if ($signed(tmp16) > $signed(40'h007fffffff)) begin
                            tmp16[31:0] <= 32'h7fffffff; 
                        end else if($signed(tmp16) < $signed(40'hff80000000)) begin
                            tmp16[31:0] <= 32'h80000000;  
                        end else begin
                            tmp16 <= tmp16;  
                        end
                    end

                    3'b100: begin
                        tmp16 <= 40'd0; 
                        tmp8_2 <= 20'd0;
                        tmp8_1 <= 20'd0;
                    end

                    3'b101: begin
                        tmp8_2 <= {{12{mul_2[7]}}, mul_2} * {{12{mulc_2[7]}}, mulc_2};
                        tmp8_1 <= {{12{mul_1[7]}}, mul_1} * {{12{mulc_1[7]}}, mulc_1};
                    end

                    3'b110: begin
                        tmp8_2 <= tmp8_2 + {{12{mul_2[7]}}, mul_2} * {{12{mulc_2[7]}}, mulc_2};
                        tmp8_1 <= tmp8_1 + {{12{mul_1[7]}}, mul_1} * {{12{mulc_1[7]}}, mulc_1};
                    end
                    3'b111: begin
                        if($signed(tmp8_2) > $signed(20'h07fff)) begin
                            tmp8_2[15:0] <= 16'h7fff; 
                        end else if($signed(tmp8_2) < $signed(20'hf8000)) begin
                            tmp8_2[15:0] <= 16'h8000; 
                        end else begin
                            tmp8_2 <= tmp8_2;
                        end
                            
                        if($signed(tmp8_1) > $signed(20'h07fff)) begin
                            tmp8_1[15:0] <= 16'h7fff;
                        end else if($signed(tmp8_1) < $signed(20'hf8000)) begin
                            tmp8_1[15:0] <= 16'h8000;
                        end else begin
                            tmp8_1 <= tmp8_1;
                        end
                    end
                    
                    default: begin
                        tmp8_2 <= tmp8_2;
                        tmp8_1 <= tmp8_1;
                        tmp16 <= tmp16; 
                    end
                endcase 
            end
        end
    end
    always @(posedge clk) begin
        if (!reset_n) begin
            {protect[7:0], result[31:0]} <= 40'd0;
        end else begin
            if (!stall) begin
                case (ins2)
                    3'b000: begin
                        {protect[7:0], result[31:0]} <= tmp16;
                    end 

                    3'b001: begin
                        {protect[7:0], result[31:0]} <= tmp16;
                    end

                    3'b010: begin
                        {protect[7:0], result[31:0]} <= tmp16;
                    end

                    3'b011: begin
                        result <= tmp16[31:0];
                    end

                    3'b100: begin
                        {protect[3:0], result[15:0]} <= tmp8_2;
                        {protect[7:4], result[31:16]} <= tmp8_1;
                    end

                    3'b101: begin
                        {protect[3:0], result[15:0]} <= tmp8_2;
                        {protect[7:4], result[31:16]} <= tmp8_1;
                    end

                    3'b110: begin
                        {protect[3:0], result[15:0]} <= tmp8_2;
                        {protect[7:4], result[31:16]} <= tmp8_1;
                    end

                    3'b111: begin
                        result[15:0] <= tmp8_2[15:0];
                        result[31:16] <= tmp8_1[15:0];
                    end

                    default: begin
                        {protect[7:0], result[31:0]} <= {protect[7:0], result[31:0]};                    
                    end
                endcase
            end 
            else
                {protect[7:0], result[31:0]} <= {protect[7:0], result[31:0]};
        end
    end

endmodule
