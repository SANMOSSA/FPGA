module ALUop (n1,n2,op,s1);
  input logic [7:0] n1;
  input logic [7:0] n2;
  input logic [3:0] op;
  output logic signed [7:0] s1;
  
  wire signed [7:0] n3;
  wire signed [7:0] n4;
  
  assign n3 = n1;
  assign n4 = n2;
  
  always_comb
    begin 
      case (op)
        4'b0000: s1 <= n1 + n2;
        4'b1000: s1 <= n1 - n2;

        4'b0001: s1 <= n1 << n2;
        4'b0010: s1 <= n1 < n2;
        4'b0100: s1 <= (~n1 & ~n2) | (n1 & n2);
        4'b0101: s1 <= n1 >> n2;

        4'b1101: s1 <= n1 >>> n2;
        4'b0110: s1 <= n1 & n2;
        4'b0111: s1 <= n1 | n2;
        4'b0011: s1 <= n3 < n4; // con signo
        default: s1 <= 8'h00;
      endcase
    end
	 
endmodule

