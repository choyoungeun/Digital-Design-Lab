module TestBench;
reg a,b,c;
wire o;

delay my_module(o,a,b,c);

initial
begin
$monitor($time," A = %b,B = %b,C = %b,O = %b",a,b,c,o);
end

initial
begin
a=1'b0; b=1'b0; c=1'b0;
#10
a=1'b1; b=1'b1; c=1'b1;
#20
b=1'b0; c=1'b0;
#10
b=1'b1;
#2
b=1'b0;
#2
c=1'b1;
#1
c=1'b0;
$finish;
end
endmodule