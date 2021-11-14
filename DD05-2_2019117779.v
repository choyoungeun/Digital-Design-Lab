module delay(O,A,B,C);
input A,B,C;
output O;
wire E;

assign #5 E =A&B;
assign #4 O =E|C;

endmodule
