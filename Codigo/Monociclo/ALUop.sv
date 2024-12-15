module ALUop (A,B,ALUop,ALUS);
  input logic [31:0] A;
  input logic [31:0] B;
  input logic [3:0] ALUop;
  output logic signed [31:0] ALUS;
  
  wire signed [31:0] n3;
  wire signed [31:0] n4;
  
  assign n3 = A;
  assign n4 = B;
  
  always_comb
    begin 
      case (ALUop)
        4'b0000: ALUS <= A +B;
        4'b1000: ALUS <= A -B;

        4'b0001: ALUS <= A << B;
        4'b0010: ALUS <= A <B;
        4'b0100: ALUS <= (~A & ~B) | (A &B);
        4'b0101: ALUS <= A >> B;

        4'b1101: ALUS <= A >>>B;
        4'b0111: ALUS <= A &B;
        4'b0110: ALUS <= A |B;
        4'b0011: ALUS <= n3 < n4; // con signo
        default: ALUS <= A +B;
      endcase
    end
	 
endmodule

