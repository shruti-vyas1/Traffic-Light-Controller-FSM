module TB_traffic_fsm();
reg clk;
reg reset;

wire [2:0] light;

traffic_light_fsm k1(clk,reset,light);

always
begin
    #5 clk = ~clk;
end

initial
begin
    clk = 0;
    reset = 1;
    
    #10;
    reset = 0;
    
    #200;
    
    $finish;
end

initial
begin
    $monitor("Time = %0t | Reset = %b | Light = %b", $time, reset, light);
end

endmodule
