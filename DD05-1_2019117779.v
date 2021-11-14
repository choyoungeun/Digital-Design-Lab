module BCDtoSevenSeg(
    input [3:0] BCDIn,
    output reg [6:0] rlt
);
integer cnt=0;
always @(BCDIn)
begin
    if(BCDIn==4'd0)begin
    if(cnt==0)begin
    rlt = bit_add(1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0);
    cnt=cnt+1;
    end
    else if(cnt==1)
    rlt = bit_add(1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0);
    end
    else if(BCDIn==4'd1)//0110000
    rlt = bit_add(1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0);
    else if(BCDIn==4'd2)
    rlt = bit_add(1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b1);
    else if(BCDIn==4'd3)
    rlt = bit_add(1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1);
    else if(BCDIn==4'd4)
    rlt = bit_add(1'b0,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1);
    else if(BCDIn==4'd5)
    rlt = bit_add(1'b1,1'b0,1'b1,1'b1,1'b0,1'b1,1'b1);
    else if(BCDIn==4'd6)
    rlt = bit_add(1'b1,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1);
    else if(BCDIn==4'd7)
    rlt = bit_add(1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0);
    else if(BCDIn==4'd8)
    rlt = bit_add(1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
    else if(BCDIn==4'd9)
    rlt = bit_add(1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1);
    else if(BCDIn==4'd10)
    rlt = bit_add(1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1);
    else if(BCDIn==4'd11)
    rlt = bit_add(1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1);
    else if(BCDIn==4'd12)
    rlt = bit_add(1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0);
    else if(BCDIn==4'd13)
    rlt = bit_add(1'b0,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1);
    else if(BCDIn==4'd14)
    rlt = bit_add(1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1);
    else if(BCDIn==4'd15)
    rlt = bit_add(1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1);
    
end

function [6:0] bit_add;
input A,B,C,D,E,F,G;
begin
bit_add={A,B,C,D,E,F,G};
end
endfunction

endmodule


module Top;

reg [3:0] BCDInput;
wire [6:0] result;

BCDtoSevenSeg MY_MODULE(BCDInput, result);

initial
begin
$monitor($time,"    BCDIn = %d  a,b,c,d,e,f,g =  %b",BCDInput,result);
end

initial begin
    BCDInput <= 4'd0;
    #10
    BCDInput <= 4'd1;
    #10
    BCDInput <= 4'd2;
    #10
    BCDInput <= 4'd3;
    #10
    BCDInput <= 4'd4;
    #10
    BCDInput <= 4'd5;
    #10
    BCDInput <= 4'd6;
    #10
    BCDInput <= 4'd7;
    #10
    BCDInput <= 4'd8;
    #10
    BCDInput <= 4'd9;
    #10
    BCDInput <= 4'd10; // Error start
    #10
    BCDInput <= 4'd11;
    #10
    BCDInput <= 4'd12;
    #10
    BCDInput <= 4'd13;
    #10
    BCDInput <= 4'd14;
    #10
    BCDInput <= 4'd15;
    #10
    BCDInput <= 4'd0;
    $finish;
end

endmodule