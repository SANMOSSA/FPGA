`include "Sumador.sv"
`include "IMmem.sv"
`include "BUnit.sv"
`include "CUnit.sv"
`include "RUnit.sv"
`include "ImmGen.sv"
`include "ALUop.sv"
`include "DMmem.sv"
`include "Mux2a1de32.sv"
`include "Mux3a1de32.sv"
`include "RegistroGeneral.sv"

module SegmentadoSW(clk);
  input     logic           clk;

/*MuxprePC*/
  logic [31:0] PCInc_fe;
  logic [31:0] ALURes_output;
  logic  NextPCSrc_ex;
  logic [31:0] InputPC_fe;
Mux2a1de32 MuxprePC (PCInc_fe,ALURes_output,NextPCSrc_ex,InputPC_fe);

/*RegPC*/
//logic [31:0] InputPC_fe;
  logic [31:0] PC_fe;
RegistroGeneral RegPC(clk,1'b1,1'b0,InputPC_fe,PC_fe);

/*sumador*/
//logic [31:0] PC_fe;
//logic [31:0] PCInc_fe;
Sumador sumador(PC_fe,PCInc_fe);

/*IMmen*/
//logic [31:0] PC_fe;
  logic [31:0] Inst_fe;
IMmem InstIMmen(PC_fe,Inst_fe);

/*RegPCInc_de*/
//logic [31:0] PCInc_fe;
  logic [31:0] PCInc_de;
RegistroGeneral RegPCInc_de(clk,1'b1,1'b0,PCInc_fe,PCInc_de);

/*RegPC_de*/
//logic [31:0] PC_fe;
  logic [31:0] PC_de;
RegistroGeneral RegPC_de(clk,1'b1,1'b0,PC_fe,PC_de);

/*RegInst_de*/
//logic [31:0] Inst_fe;
  logic [31:0] Inst_de;
RegistroGeneral RegInst_de(clk,1'b1,1'b0,Inst_fe,Inst_de);

/*Control Unit*/
//Inst_de[6:0] Opcode
//Inst_de[14:12]
//Inst_de[31:25]
  logic [2:0]  ImmSrc_de;
  logic        ALUASrc_de;
  logic        ALUBSrc_de;
  logic [3:0]  ALUOp_de;
  logic        DMWr_de;
  logic [2:0]  DMCtrl_de;
  logic [1:0]  RUDatawrSrc_de;
  logic        RuWr_de;
  logic [4:0]  BUOp_de;
CUnit InstCUnit (Inst_de[6:0],Inst_de[14:12],Inst_de[31:25],ImmSrc_de,ALUASrc_de,ALUBSrc_de,ALUOp_de,DMWr_de,DMCtrl_de,RUDatawrSrc_de,RuWr_de,BUOp_de);


/*Register Unit */
//Inst_de[19:15]
//Inst_de[24:20]
  logic [31:0] DataWr_wb;
  logic [4:0] rd_wb;
  logic        RuWr_wb;
  logic [31:0] RUrs1_de;
  logic [31:0] RUrs2_de; 
RUnit InstRUnit(clk,DataWr_wb,rd_wb,Inst_de[19:15],Inst_de[24:20],RuWr_wb,RUrs1_de,RUrs2_de);

/*ImmGen*/
//Inst_de[31:7]
//logic [2:0]  ImmSrc_de;
  logic [31:0] ImmExt_de;
ImmGen InstImmGen (Inst_de[31:7], ImmSrc_de,ImmExt_de);

/*RegALUASrc_de*/
//logic ALUASrc_de;
  logic ALUASrc_ex;
RegistroGeneral RegALUASrc_de(clk,1'b1,1'b0,ALUASrc_de,ALUASrc_ex);

/*RegALUBSrc_de*/
//logic ALUBSrc_de;
  logic ALUBSrc_ex;
RegistroGeneral RegALUBSrc_de(clk,1'b1,1'b0,ALUBSrc_de,ALUBSrc_ex);

/*RegALUOp_de*/
//logic [3:0] ALUOp_de;
  logic [3:0] ALUOp_ex;
RegistroGeneral RegALUOp_de(clk,1'b1,1'b0,ALUOp_de,ALUOp_ex);

/*RegDMWr_de*/
//logic DMWr_de;
  logic DMWr_ex;
RegistroGeneral RegDMWr_de(clk,1'b1,1'b0,DMWr_de,DMWr_ex);

/*RegDMCtrl_de*/
//logic [2:0] DMCtrl_de
  logic [2:0] DMCtrl_ex;
RegistroGeneral RegDMCtrl_de(clk,1'b1,1'b0,DMCtrl_de,DMCtrl_ex);

/*RegRUDatawrSrc_ex*/
//logic [1:0]  RUDatawrSrc_de;
  logic [1:0]  RUDatawrSrc_ex;
RegistroGeneral RegRUDatawrSrc_ex(clk,1'b1,1'b0,RUDatawrSrc_de,RUDatawrSrc_ex); 

/*RegRuWr_de*/
//logic RuWr_de;
  logic RuWr_ex;
RegistroGeneral RegRuWr_de(clk,1'b1,1'b0,RuWr_de,RuWr_ex); 

/*RegBUOp_de*/
//logic [4:0] BUOp_de;
  logic [4:0] BUOp_ex;
RegistroGeneral RegBUOp_de(clk,1'b1,1'b0,BUOp_de,BUOp_ex); 


/*RegPCInc_ex*/
//logic [31:0] PCInc_de;
  logic [31:0] PCInc_ex;
RegistroGeneral RegPCInc_ex(clk,1'b1,1'b0,PCInc_de,PCInc_ex);  

/*RegPC_ex*/
//logic [31:0] PC_de;
  logic [31:0] PC_ex; 
RegistroGeneral RegPC_ex(clk,1'b1,1'b0,PC_de,PC_ex);  

/*RegRUrs1_ex*/
//logic [31:0] RUrs1_de;
  logic [31:0] RUrs1_ex;
RegistroGeneral RegRUrs1_ex(clk,1'b1,1'b0,RUrs1_de,RUrs1_ex);  

/*RegRUrs2_ex*/
//logic [31:0] RUrs2_de;
  logic [31:0] RUrs2_ex; 
RegistroGeneral RegRUrs2_ex(clk,1'b1,1'b0,RUrs2_de,RUrs2_ex);  

/*RegImmExt_ex*/
//logic [31:0] ImmExt_de;
  logic [31:0] ImmExt_ex;
RegistroGeneral RegImmExt_ex(clk,1'b1,1'b0,ImmExt_de,ImmExt_ex);  

/*Regrd_ex*/
//Inst_de[11:7]
  logic [4:0] rd_ex; 
RegistroGeneral Regrd_ex(clk,1'b1,1'b0,Inst_de[11:7],rd_ex);  
  
/*Branch Unit*/
//logic [31:0] RUrs1_ex;
//logic [31:0] RUrs2_ex;
//logic [4:0] BUOp_ex;
//logic NextPCSrc_ex;
BUnit InstBUnit (RUrs1_ex,RUrs2_ex,BUOp_ex,NextPCSrc_ex );

/*MUXA*/
//logic [31:0] RUrs1_ex; 
//logic [31:0] PC_ex;
//logic ALUASrc_ex;
  logic [31:0] MUXA_output;
Mux2a1de32  MUXA(RUrs1_ex,PC_ex,ALUASrc_ex, MUXA_output);

/*MUXB*/
//logic [31:0] ImmExt_ex;
//logic [31:0] RUrs2_ex;
//logic ALUBSrc_ex;
  logic [31:0] MUXB_output;
Mux2a1de32  MUXB(RUrs2_ex,ImmExt_ex,ALUBSrc_ex,MUXB_output);

/*ALU*/
//logic [31:0] MUXA_output;
//logic [31:0] MUXB_output;
//logic [5:0] ALUOp_ex;
//logic [31:0] ALURes_output;
ALUop InstALUop (MUXA_output, MUXB_output, ALUOp_ex, ALURes_output );

/*RegDMWr_me*/
//logic DMWr_ex;
  logic DMWr_me;
RegistroGeneral RegDMWr_me(clk,1'b1,1'b0,DMWr_ex,DMWr_me);  

/*RegDMCtrl_me*/
//logic [2:0] DMCtrl_ex;
  logic [2:0] DMCtrl_me;
RegistroGeneral RegDMCtrl_me(clk,1'b1,1'b0,DMCtrl_ex,DMCtrl_me);

/*RegRuWr_me*/
//logic RuWr_ex;
//logic RuWr_me;
RegistroGeneral RegRuWr_me(clk,1'b1,1'b0,RuWr_ex,RuWr_me);

/*RegRUDatawrSrc_me*/
//logic [1:0]  RUDatawrSrc_ex;
  logic [1:0]  RUDatawrSrc_me;
RegistroGeneral RegRUDatawrSrc_me(clk,1'b1,1'b0,RUDatawrSrc_ex,RUDatawrSrc_me);

/*RegPCInc_me*/
//logic [31:0] PCInc_ex;
  logic [31:0] PCInc_me;
RegistroGeneral RegPCInc_me(clk,1'b1,1'b0,PCInc_ex,PCInc_me);

/*RegALURes_me*/ 
//logic [31:0] ALURes_output;
 logic [31:0] ALURes_me;
RegistroGeneral RegALURes_me(clk,1'b1,1'b0,ALURes_output,ALURes_me);

/*Regrs2_me*/
//logic [4:0] RUrs2_ex ;
  logic [31:0] RUrs2_me;
RegistroGeneral Regrs2_me(clk,1'b1,1'b0,RUrs2_ex,RUrs2_me);

/*Regrd_me*/
//logic [4:0] rd_ex;
  logic [4:0] rd_me;
RegistroGeneral Regrd_me(clk,1'b1,1'b0,rd_ex,rd_me);

/*DMmem*/
//logic DMWr_me;
//logic [2:0]DMCtrl_me;
//logic [31:0] ALURes_me;
//logic [31:0] RUrs2_me; 
  logic [31:0] DMDataRd_output;
DMmem InstDMmem (ALURes_me,RUrs2_me,DMWr_me,DMCtrl_me,DMDataRd_output);

/*RegRUDatawrSrc_wb*/
//logic [1:0]  RUDatawrSrc_me;
  logic [1:0]  RUDatawrSrc_wb;
RegistroGeneral RegRUDatawrSrc_wb(clk,1'b1,1'b0,RUDatawrSrc_me,RUDatawrSrc_wb);

/*RegRuWr_wb*/
//logic RuWr_me;
//logic RuWr_wb;
RegistroGeneral RegRuWr_wb(clk,1'b1,1'b0,RuWr_me,RuWr_wb);

/*RegPCInc_wb*/
//logic [31:0] PCInc_me;
  logic [31:0] PCInc_wb;
RegistroGeneral RegPCInc_wb(clk,1'b1,1'b0,PCInc_me,PCInc_wb);

/*RegDMDataRd_wb*/
//logic [31:0] DMDataRd_output;
  logic [31:0] DMDataRd_wb;
RegistroGeneral RegDMDataRd_wb(clk,1'b1,1'b0,DMDataRd_output,DMDataRd_wb);

/*RegALURes_wb*/ 
//logic [31:0] ALURes_me;
  logic [31:0] ALURes_wb;
RegistroGeneral RegALURes_wb(clk,1'b1,1'b0,ALURes_me,ALURes_wb);

/*Regrd_wb*/
//logic [4:0] rd_me;
//logic [4:0] rd_wb; 
RegistroGeneral Regrd_wb(clk,1'b1,1'b0,rd_me,rd_wb);


/*MuxDataWr_wb*/
//logic [31:0] PCInc_wb;
//logic [31:0] DMDataRd_wb;
//logic [31:0] ALURes_wb;
//logic [31:0] DataWr_wb;
//logic [1:0]  RUDatawrSrc_wb;
  Mux3a1de32 MuxDataWr_wb(PCInc_wb,DMDataRd_wb,ALURes_wb,RUDatawrSrc_wb,DataWr_wb);

endmodule