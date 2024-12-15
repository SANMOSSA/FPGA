`include "Decodificador.svh"
`include "ROMmem.svh"
`include "ALUop.svh"

module Toplevel(sw,enA,enB,enC,clk,Seg7A1,Seg7A2,Seg7B1,Seg7B2,Seg7S1,Seg7S2,LEDs);
  input logic [7:0]sw;
  input logic enA,enB,enC,clk;

  output logic signed [6:0] Seg7A1;
  output logic signed [6:0] Seg7A2;
  
  output logic signed [6:0] Seg7B1;
  output logic signed [6:0] Seg7B2;
  
  output logic signed [6:0] Seg7S1;
  output logic signed [6:0] Seg7S2;

  output logic signed [3:0] LEDs;

  logic [19:0] data;
  logic [19:0] palabra;
  logic [7:0] adress;
  logic [7:0] aluS;
  logic [7:0] respuesta;

  
 
  always_ff@(posedge clk)
    begin
      if(enA)
        adress = sw;
      if(enB)
        palabra = data;
      if (enC)
        respuesta = aluS;
    end

  assign LEDs = palabra[3:0];
  
  ROMmem instROM (adress,clk,data);
  ALUop instALU(palabra[19:12],palabra[11:4],palabra[3:0],aluS);
  Decodificador instdecoA (palabra[19:12],Seg7A1, Seg7A2);
  Decodificador instdecoB (palabra[11:4],Seg7B1, Seg7B2);
  Decodificador instdecoS (respuesta,Seg7S1, Seg7S2);
  
endmodule
