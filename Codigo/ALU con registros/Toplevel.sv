`include"ALU.svh"
/*
`include"Registro.svh"
`include"Registroalu.svh"
*/
`include"Decodificador.svh"

/*
sw los sw 7 seria el sw 9 el 0 seria el sw 2
Seg7N1 es el display 1 de iz a derecha
Seg7N2 es el display 1 de der a iz
LEDS DE CUALQUIER ORDEN 
*/

module Toplevel (sw,enA,enB,enO,enS,clk,Seg7A1,Seg7A2,Seg7B1,Seg7B2,Seg7S1,Seg7S2,LEDS);
  
  input logic [7:0] sw;
  input logic enA;
  input logic enB;
  input logic enO;
  input logic enS;
  input logic clk;
  
  output logic signed [6:0] Seg7A1;
  output logic signed [6:0] Seg7A2;
  
  output logic signed [6:0] Seg7B1;
  output logic signed [6:0] Seg7B2;
  
  output logic signed [6:0] Seg7S1;
  output logic signed [6:0] Seg7S2;

  output logic signed [3:0] LEDS;
  
  logic [7:0] sA = 0;
  logic [7:0] sB = 0;
  logic [3:0] sO = 0;
  logic [7:0] sS = 0;
  logic [7:0] aluS ;
  
  logic [6:0] decodificadorA;
  logic [6:0] decodificadorB;
  logic [6:0] decodificadorS;
  
   always_ff @ (posedge clk)
    begin
        if(enA)
             sA <= sw;
        if(enB)
             sB <= sw;
        if(enO)
             sO <= sw[3:0];
        if(enS)
             sS <= aluS;
    end
  
  ALU instALU(sA,sB,sO,aluS);
  Decodificador instdecoA (sA,Seg7A1,Seg7A2);
  Decodificador instdecoB (sB,Seg7B1,Seg7B2);
  Decodificador instdecoS (sS,Seg7S1,Seg7S2);
  assign LEDS = sO;
  
   
  
endmodule
