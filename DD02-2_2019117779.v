
module MyComparatorGate(A_lt_B,A_gt_B,A_eq_B,A,B);

output A_lt_B,A_gt_B,A_eq_B;
input [3:0] A,B;

wire [3:0] An,Bn;//not A,B
not(An[0],A[0]);
not(An[1],A[1]);
not(An[2],A[2]);
not(An[3],A[3]);
not(Bn[0],B[0]);
not(Bn[1],B[1]);
not(Bn[2],B[2]);
not(Bn[3],B[3]);

wire [3:0] a1_out,a2_out;
wire n0,n1,n2,n3;
wire less1,less2,less3;
wire greater1,greater2,greater3;


and a0(a1_out[0],An[0],B[0]);
and a1(a2_out[0],Bn[0],A[0]);
nor nr0(n0,a1_out[0],a2_out[0]);

and a2(a1_out[1],An[1],B[1]);
and a3(a2_out[1],Bn[1],A[1]);
nor nr1(n1,a1_out[1],a2_out[1]);

and a4(a1_out[2],An[2],B[2]);
and a5(a2_out[2],Bn[2],A[2]);
nor nr2(n2,a1_out[2],a2_out[2]);

and a6(a1_out[3],An[3],B[3]);
and a7(a2_out[3],Bn[3],A[3]);
nor nr3(n3,a1_out[3],a2_out[3]);

and eq(A_eq_B,n3,n2,n1,n0);

and gt1(greater1,n3,n2,n1,a2_out[0]);
and gt2(greater2,n3,n2,a2_out[1]);
and gt3(greater3,n3,a2_out[2]);

and lt1(less1,n3,n2,n1,a1_out[0]);
and lt2(less2,n3,n2,a1_out[1]);
and lt1(less3,n3,a1_out[2]);

or gt(A_gt_B,a2_out[3],greater3,greater2,greater1);

or lt(A_lt_B,a1_out[3],less3,less2,less1);

endmodule


module Top;

wire a_gt_b,a_lt_b,a_eq_b;
reg [3:0] a,b;

MyComparatorGate mygate(a_lt_b,a_gt_b,a_eq_b,a,b);

initial
begin
 $monitor($time," A = %h, B = %h, A_lt_B = %b, A_gt_B = %b, A_eq_B = %b",a,b,a_lt_b,a_gt_b,a_eq_b);
end

initial
begin
a=4'h0; b=4'h1;

#10 a=4'hf; b=4'h3; 
#10 a=4'ha; b=4'hb;
#10 a=4'h0; b=4'h0;
#10 a=4'h7; b=4'hd;
#10 a=4'h9; b=4'h9;
$finish;
end
endmodule

