
module Sumador(ProCount,PCInc);
  input logic [31:0]ProCount;
  output logic [31:0]PCInc = 0;
  always_comb
    begin
      PCInc <= ProCount + 4'h4;
    end
endmodule


/*
module Sumador_tb;
  	 logic [31:0] ProCount;
  	 logic [31:0] PCInc;

  
   Sumador Suminst(
        .PCInc(PCInc),
        .ProCount(ProCount));
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    ProCount = 16'h4000;
    repeat(9) begin
      #15
      ProCount = PCInc;
    end
    $finish;
  	end
endmodule
*/