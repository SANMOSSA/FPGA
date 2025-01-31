module ALU (n1,n2,o,s1);
  input logic [3:0] n1;
  input logic [3:0] n2;
  input logic [1:0] o;
  output logic signed [3:0] s1;
  
  always_comb
    begin 
      case (o)
        2'b00: s1 <= n1 & n2;
        2'b01: s1 <= n1 | n2;
        2'b10: s1 <= n1 + n2;
        2'b11: s1 <= n1 - n2;
        default: s1 <= s1;
      endcase
    end
endmodule
 