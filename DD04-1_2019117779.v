
module MyComparatorBeh(A_lt_B,A_gt_B,A_eq_B,A,B,CLK,nRST);
output reg A_lt_B=0,A_gt_B=0,A_eq_B=0;
input [3:0] A,B;
input CLK,nRST;

always @(posedge CLK)
    begin
        if(nRST==1'b1)
        begin
        @(A or B)
            begin
                if(A<B)
                begin
                A_eq_B<=0;
                A_lt_B<=1;
                A_gt_B<=0;
                end
                else if(A==B)
                begin
                A_eq_B<=1;
                A_lt_B<=0;
                A_gt_B<=0;
                end
                else if(A>B)
                begin
                A_eq_B<=0;
                A_lt_B<=0;
                A_gt_B<=1;
                end
            end
        end
    end

endmodule

module Top;
wire a_lt_b,a_gt_b,a_eq_b;
reg [3:0] a,b;
reg clk,nrst;

MyComparatorBeh my_module(a_lt_b,a_gt_b,a_eq_b,a,b,clk,nrst);

initial
begin
    $monitor($time," A = %h, B = %h, A_lt_B = %b, A_gt_B = %b, A_eq_B = %b",a,b,a_lt_b,a_gt_b,a_eq_b);
end

initial
begin
clk=1'b0; nrst=1'b0; a=4'h0; b=4'h1; 
#5 clk=1'b1;
#5 clk=1'b0; nrst=1'b1; a=4'hf; b=4'h3; 
#5 clk=1'b1;
#5 clk=1'b0; a=4'ha; b=4'hb; 
#5 clk=1'b1;  
#5 clk=1'b0; a=4'h0; b=4'h0; 
#5 clk=1'b1;  
#5 clk=1'b0; a=4'h7; b=4'hd; 
#5 clk=1'b1;  
#5 clk=1'b0; a=4'h9; b=4'h9; 
#5 clk=1'b1;  
$finish;
end

endmodule