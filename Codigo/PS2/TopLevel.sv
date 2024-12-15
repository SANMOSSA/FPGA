`include "PS2.sv"
`include "RegistroGeneral.sv"
`include "Decodificador.sv"
module Toplevel (clkps,clk,Rx,Segmento1,Segmento2,leds);
  input logic clkps,clk;
  input logic Rx;
  output logic  [6:0] Segmento1;
  output logic  [6:0] Segmento2;
  output logic [7:0] leds;
  
  logic En;
  logic [7:0] ascii=0;
  logic [7:0] numero;
  logic [4:0]contador;
  always_comb
	leds <= numero;
  PS2 instPS2 (clkps,Rx,ascii);
  RegistroGeneral instReg(clk,1,0,ascii,numero);
  Decodificador intDeco (numero,Segmento1,Segmento2);
endmodule
