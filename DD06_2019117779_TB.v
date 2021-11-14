module Testbench;

wire y;
reg clk,Nrst,x;

sequence_detector sd(y,clk,Nrst,x);

initial
begin
$monitor($time,"    state=%b   input X = %b , output Y = %b ",sd.state,x,y);
end

always #5
    begin
        clk = ~clk;
    end

initial
begin
    x = 1'b0; Nrst = 1'b0; clk = 1'b0;
    #20 
    Nrst = 1'b1;
    #20 
    x = 1'b1;
    #30 
    x = 1'b0;
    #20 
    x = 1'b1;
    #10 
    x = 1'b0;
    #20 
    x = 1'b1;
    #40 
    x = 1'b0;
 $finish;
end


 endmodule
