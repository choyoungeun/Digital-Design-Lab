module BCDtoDecimalBeh(DECOut,BCDIn,CLK,nRST);
input [3:0] BCDIn;
output reg [9:0] DECOut;
input CLK,nRST;

always @(posedge CLK)
begin
    if(nRST==1'b1)
    begin
       @(BCDIn)
        begin
            case(BCDIn)
            4'b0000:DECOut = 10'b0000000001;
            4'b0001:DECOut = 10'b0000000010; 
            4'b0010:DECOut = 10'b0000000100;
            4'b0011:DECOut = 10'b0000001000;
            4'b0100:DECOut = 10'b0000010000;
            4'b0101:DECOut = 10'b0000100000;
            4'b0110:DECOut = 10'b0001000000;
            4'b0111:DECOut = 10'b0010000000;
            4'b1000:DECOut = 10'b0100000000;
            4'b1001:DECOut = 10'b1000000000;
            default: DECOut = 10'b1111111111;
            endcase
        end
    end
end

endmodule

module Top;
wire [9:0] DEC_out;
reg [3:0] BCD_in;
reg clk,nrst;

BCDtoDecimalBeh my_module(DEC_out,BCD_in,CLK,nRST);

initial
    begin
        $monitor($time," BCDIn = %d --> DECOut = %b",BCD_in,DEC_out);
    end
 
initial
    begin
    clk=1'b0; nrst=1'b0; BCD_in=4'b0000;
    #5 clk=1'b1;
    #5 clk=1'b0; nrst=1'b1; BCD_in=4'b0001;
    #5 clk=1'b1;//15
    #5 clk=1'b0; BCD_in=4'b0010;//20
    #5 clk=1'b1; //25
    #5 clk=1'b0; BCD_in=4'b0011;//30
    #5 clk=1'b1;//35
    #5 clk=1'b0; BCD_in=4'b0100;//40
    #5 clk=1'b1;//45
    #5 clk=1'b0; BCD_in=4'b0101;//50
    #5 clk=1'b1;//55
    #5 clk=1'b0; BCD_in=4'b0110;//60
    #5 clk=1'b1;//65
    #5 clk=1'b0; BCD_in=4'b0111;//70
    #5 clk=1'b1;//75
    #5 clk=1'b0; BCD_in=4'b1000;//80
    #5 clk=1'b1;//85
    #5 clk=1'b0; BCD_in=4'b1001;//90
    #5 clk=1'b1;//95
    #5 clk=1'b0; BCD_in=4'b1010;//100
    #5 clk=1'b1;//105
    #5 clk=1'b0; BCD_in=4'b1011;//110
    #10 BCD_in=4'b1100;//120
    #10 BCD_in=4'b1101;//130
    #10 BCD_in=4'b1110;//140
    #10 BCD_in=4'b1111;//150
    #10 BCD_in=4'b0000;//160
    #5  clk=1'b1;//165
    $finish;
    end
endmodule


