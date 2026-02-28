module traffic_light_fsm(
    input clk,
    input reset,
    output reg [2:0] light
);

reg [1:0] state;

parameter RED    = 2'b00;
parameter GREEN  = 2'b01;
parameter YELLOW = 2'b10;

reg [3:0] count;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        state <= RED;
        count <= 0;
    end
    else
    begin
        case (state)
        
            RED:
            begin
                light <= 3'b100;
                if (count < 5)
                    count <= count + 1;
                else
                begin
                    count <= 0;
                    state <= GREEN;
                end
            end
            
            GREEN:
            begin
                light <= 3'b001;
                if (count < 5)
                    count <= count + 1;
                else
                begin
                    count <= 0;
                    state <= YELLOW;
                end
            end
            
            YELLOW:
            begin
                light <= 3'b010;
                if (count < 3)
                    count <= count + 1;
                else
                begin
                    count <= 0;
                    state <= RED;
                end
            end
            
            default:
                state <= RED;
                
        endcase
    end
end

endmodule
