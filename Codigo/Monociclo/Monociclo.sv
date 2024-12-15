`include "Sumador.sv"
`include "IMmem.sv"
`include "CUnit.sv"
`include "RUnit.sv"
`include "ImmGen.sv"
`include "Mux2a1de32.sv"
`include "BUnit.sv"
`include "ALUop.sv"
`include "DMmem.sv"
`include "Mux3a1de32.sv"

module Monociclo(clk,sw,Leds);
  input     logic   [9:0]   sw;
  input     logic           clk;
  output    logic   [9:0]   Leds;
//sumador
  logic [31:0] inputPC;
  logic [31:0] outputPC=0;
//IMmen
  logic [31:0] PCInc;
  logic [31:0] Inst;
//Control Unit
  logic [2:0] ImmSrc;
  logic       ALUASrc;
  logic       ALUBSrc;
  logic [3:0] ALUOp;
  logic       DMWr;
  logic [2:0] DMCtrl;
  logic [1:0] RUDatawrSrc;
  logic       RuWr;
  logic [4:0] BUOp;
//Register Unit 
  logic [31:0] RUDataWr;
  logic [31:0] RUrs1;
  logic [31:0] RUrs2; 
//ImmGen
  logic [31:0] ImmExt;
//Multiplexor A 
  logic [31:0] MuxA;
//Multiplexor B
  logic [31:0] MuxB;
//Branch unit
  logic NextPCSrc;
//Aritmetic logic Unit
  logic [31:0] ALUS;
//DM memory
  logic [31:0] datard;

//Declaracion del program counter
  always_ff@(posedge clk)
    begin
      outputPC = inputPC;
    end
  
  Sumador instSumador (outputPC,PCInc);
  IMmem   instIMmem   (outputPC,Inst);
  CUnit   instCUnit   (Inst[6:0],Inst[14:12],Inst[31:25], ImmSrc,ALUASrc,ALUBSrc,ALUOp,DMWr,DMCtrl,RUDatawrSrc,RuWr,BUOp);
  RUnit   instRUnit   (clk,RUDataWr,Inst[11:7],Inst[19:15],Inst[24:20],RuWr,RUrs1,RUrs2);
  ImmGen  instImmGen  (Inst[31:7],ImmSrc,ImmExt);
  Mux2a1de32 instMux2a1de32A (RUrs1,outputPC,ALUASrc,MuxA);
  Mux2a1de32 instMux2a1de32B (RUrs2,ImmExt,ALUBSrc,MuxB);
  BUnit instBUnit (RUrs1,RUrs2,BUOp,NextPCSrc);
  ALUop instALUop (MuxA,MuxB,ALUOp,ALUS);
  Mux2a1de32 instMux2a1de32C (PCInc,ALUS,NextPCSrc,inputPC);
  DMmem instDMmem (ALUS,RUrs2,DMWr,DMCtrl,sw,datard,Leds);
  Mux3a1de32 instMux3a1de32 (PCInc,datard,ALUS,RUDatawrSrc,RUDataWr);

endmodule