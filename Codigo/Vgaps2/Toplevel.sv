module Toplevel (clkps,clk,Rx,numero);
  input logic clkps,clk;
  input logic Rx;
  output logic [7:0] numero;
  
  logic [7:0] ascii = 0;
  
  PS2 instPS2 (clkps,Rx,ascii);
  RegistroGeneral instReg(clk,1,0,ascii,numero);
endmodule
