module BCDtoDecimal(DECOut,BCDIn);
input [3:0] BCDIn;
output [9:0] DECOut;

assign DECOut = (BCDIn==4'b0000)? 10'b0000000001:
                (BCDIn==4'b0001)? 10'b0000000010:
                (BCDIn==4'b0010)? 10'b0000000100:
                (BCDIn==4'b0011)? 10'b0000001000:
                (BCDIn==4'b0100)? 10'b0000010000:
                (BCDIn==4'b0101)? 10'b0000100000:
                (BCDIn==4'b0110)? 10'b0001000000:
                (BCDIn==4'b0111)? 10'b0010000000:
                (BCDIn==4'b1000)? 10'b0100000000:
                (BCDIn==4'b1001)? 10'b1000000000:10'b1111111111;

endmodule

module Top;
wire [9:0] DEC_out;
reg [3:0] BCD_in;

BCDtoDecimal my_module(DEC_out,BCD_in);

initial
    begin
        $monitor($time," BCDIn = %d --> DECOut = %b",BCD_in,DEC_out);
    end
 
initial
    begin
    BCD_in=4'b0000;
    #10 BCD_in=4'b0001;
    #10 BCD_in=4'b0010;
    #10 BCD_in=4'b0011;
    #10 BCD_in=4'b0100;
    #10 BCD_in=4'b0101;
    #10 BCD_in=4'b0110;
    #10 BCD_in=4'b0111;
    #10 BCD_in=4'b1000;
    #10 BCD_in=4'b1001;
    #10 BCD_in=4'b1010;
    #10 BCD_in=4'b1011;
    #10 BCD_in=4'b1100;
    #10 BCD_in=4'b1101;
    #10 BCD_in=4'b1110;
    #10 BCD_in=4'b1111;
    #10 BCD_in=4'b0000;
    $finish;
    end
endmodule


