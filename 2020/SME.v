module SME(
	input  clk,
	input  reset,
	input  [7:0] chardata,
	input  isstring,
	input  ispattern,
	output reg match,
	output reg [4:0] match_index,
	output reg valid
);
    reg [5:0]current,string_length,string_counter;
    reg [3:0]pattern_length,pattern_counter;
    reg [7:0]str[0:33];
    reg [7:0]pattern[0:7];
    reg busy;

    integer i;
    
    
    reg [1:0]state;
    parameter IN_STRING = 2'd0;
    parameter IN_PATTERN = 2'd1;
    parameter BUSY = 2'd2;
    parameter IDLE = 2'd3;
    
    
    //state logic
    always @(*)begin
        case(1'd1)
            isstring : state = IN_STRING;
            ispattern : state = IN_PATTERN;
            busy : state = BUSY;
            default : state = IDLE;
        endcase
    end
    
    // input string
    always @(posedge clk or posedge reset)begin
        if(reset)begin
            string_counter<=0;
            string_length<=1;
            for(i=0;i<34;i=i+1) str[i] <= 8'h20;
        end
        else begin
            if(state == IN_STRING)begin
                if(busy)begin
                    string_length <= 2; // [space] str[1] [space]
                    str[1] <= chardata;
                end
                else begin
                    string_length <= string_length+1;
                    str[string_length] <= chardata;
                end
            end
        end
    end
    
    //input pattern
    always @(posedge clk or posedge reset)begin
        if(reset)begin
            pattern_counter <= 0;
            pattern_length <=0;
            for(i = 0; i < 8 ;i = i + 1) pattern[i]<=0;
        end
        else begin
            if(state == IN_PATTERN)begin
                if(busy)begin
                    pattern_length <= 1;
                    pattern[0] <= chardata;
                end
                else begin
                    pattern_length<=pattern_length+1;
                    pattern[pattern_length]<=chardata;
                end
            end
        end
    end
    
    //busy ,valid ,match ,match_index control
    always @(posedge clk,posedge reset) begin
        if(reset)begin
            match<=0;
            match_index<=0;
            valid<=0;
            busy<=0;
        end
        else begin
            case(state)
                IN_STRING : begin
                    if(busy) begin  //BUSY -> IN_STRING
                        busy <= 0;
                        valid <= 0;
                        pattern_length<= 0;
                    end
                end
                
                IN_PATTERN : begin
                    string_counter<=0;
                    pattern_counter<=0;
                    current<=0; 
                    if(busy) begin
                        busy<=0;
                        valid<=0;
                    end
                end
                BUSY : begin
                    str[string_length] <= 8'h20;// set last to space
                    if(pattern_counter == pattern_length) begin // match
                        match_index <= current-1;
                        match <= 1;
                        valid <= 1;
                    end
                    else if(string_counter == string_length+2) begin // not match
                        match <= 0;
                        valid <= 1;
                    end
                    else begin
                        case(pattern[pattern_counter])
                            8'h5E : begin                                   // mode ^
                                if(str[string_counter-1] == 8'h20)begin     // if forword charactor is space
                                    pattern_counter<=pattern_counter+1;
                                end
                                else begin
                                    current <= current+1;
                                    string_counter <= current+1;
                                end
                            end
                            8'h24 : begin                                   // $
                                if(str[string_counter] == 8'h20)begin       // if the next charactor is space
                                    pattern_counter <= pattern_counter+1;
                                end
                                else begin
                                    current <= current+1;
                                    string_counter <= current+1;
                                    pattern_counter <= 0;
                                end
                            end
                            8'h2E : begin                                   // .
                                pattern_counter <= pattern_counter + 1;     // skip it 
                                if(string_counter != 0)begin                
                                    current <= current;
                                    string_counter <= string_counter+1;
                                end
                                else begin
                                    current <= 1;
                                    string_counter<=string_counter + 2;
                                end
                            end
                            str[string_counter] : begin                    // pattern word equal to string word
                                pattern_counter <= pattern_counter+1;
                                string_counter <= string_counter+1;
                            end
                            default : begin                 //current word not matched
                                current <= current+1;       //go to the next word
                                pattern_counter<=0;         //pattern_counter reset
                                string_counter<=current+1;  //string_counter reset
                            end
                        endcase
                    end
                end
                default : begin
                    if(string_length && pattern_length && !busy)begin   // gap time
                        busy<=1;
                        //state == IDLE
                    end
                end
            endcase
        end
    end
endmodule
