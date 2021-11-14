
module sequence_detector(Y,CLK,nRST,X);
  input CLK,nRST,X;
  output Y;
  reg [1:0] state,next;
  
  parameter [1:0] s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
  
  always@(state or X)
  begin
      case(state)
      s0: if(X==0)
                next <= s0;
            else
                next <= s1;
      s1: if(X==0)
                next <= s0;
            else
                next <= s2;
      s2: if(X==0)
                next <= s0;
            else
                next <= s3;
      s3: if(X==0)
                next <= s0;
            else
                next <= s3;
      endcase
  end
  
  always@(posedge CLK) begin
    if(nRST)
        state <= next;
    else
        state <= s0;
    end  
    
  assign Y = state[1] & state[0];
    
endmodule