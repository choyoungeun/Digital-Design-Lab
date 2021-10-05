
module D_latch(Q,Qbar,En,D);

output Q, Qbar;
input En, D;

wire Dn;//not D
not(Dn,D);
wire n1_out;//output of n1
wire n2_out;//output of n2

nand n1(n1_out,D,En);
nand n2(n2_out,Dn,En);
nand s1(Q,n1_out,Qbar);
nand s2(Qbar,n2_out,Q);

endmodule


module Top;

wire q,qbar;
reg d,en;

D_latch mylatch(q,qbar,en,d);

initial
begin
 $monitor($time," D= %b, En= %b, Q= %b Qbar= %b",d,en,q,qbar);
end

initial
begin
d= 1'b0; en= 1'b0;

#5 en=1'b0; d=1'b1;

#5 en=1'b0; d=1'b0;

#2 en=1'b1; d=1'b0;

#3 en=1'b1; d=1'b1;

#5 en=1'b1; d=1'b0;

#5 en=1'b1; d=1'b1;

#2 en=1'b0; d=1'b1;

#3 en=1'b0; d=1'b0;

end

endmodule

