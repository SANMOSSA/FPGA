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
`include "FUnit.sv"
`include "MuxFw.sv"
`include "HDUnit.sv"

module SegmentadoHW(clk);
  input     logic           clk;

/*MuxprePC*/
  logic [31:0] PCInc_fe;
  logic [31:0] ALURes_output;
  logic  NextPCSrc_ex;
  logic [31:0] InputPC_fe;
Mux2a1de32 MuxprePC (PCInc_fe,ALURes_output,NextPCSrc_ex,InputPC_fe);

/*RegPC*/
  logic HDUStall;
//logic [31:0] InputPC_fe;
  logic [31:0] PC_fe;
RegistroGeneral RegPC(clk,HDUStall,1'b0,InputPC_fe,PC_fe);

/*sumador*/
//logic [31:0] PC_fe;
//logic [31:0] PCInc_fe;
Sumador sumador(PC_fe,PCInc_fe);

/*IMmen*/
//logic [31:0] PC_fe;
  logic [31:0] Inst_fe;
IMmem InstIMmen(PC_fe,Inst_fe);

/*RegPCInc_de*/
//logic HDUStall;
//logic NextPCSrc_ex;
//logic [31:0] PCInc_fe;
  logic [31:0] PCInc_de;
RegistroGeneral RegPCInc_de(clk,HDUStall,NextPCSrc_ex,PCInc_fe,PCInc_de);

/*RegPC_de*/
//logic HDUStall;
//logic NextPCSrc_ex;
//logic [31:0] PC_fe;
  logic [31:0] PC_de;
RegistroGeneral RegPC_de(clk,HDUStall,NextPCSrc_ex,PC_fe,PC_de);

/*RegInst_de*/
//logic HDUStall;
//logic NextPCSrc_ex;
//logic [31:0] Inst_fe;
  logic [31:0] Inst_de;
RegistroGeneral RegInst_de(clk,HDUStall,NextPCSrc_ex,Inst_fe,Inst_de);

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
  logic        DMrd_de;
CUnit InstCUnit (Inst_de[6:0],Inst_de[14:12],Inst_de[31:25],ImmSrc_de,ALUASrc_de,ALUBSrc_de,ALUOp_de,DMWr_de,DMCtrl_de,RUDatawrSrc_de,RuWr_de,BUOp_de,DMrd_de);

/*Hazard*/
//Inst_de[19:15];
//Inst_de[24:20];
//logic [4:0] rd_ex;
//logic DMrd_ex;
//logic HDUStall;
HDUnit InstHDUnit (Inst_de[19:15],Inst_de[24:20],rd_ex,DMrd_ex,HDUStall);

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

//--------------------------------------------------------------------
/*REGISTROS EX*/

/*RegALUASrc_ex*/
//logic ALUASrc_de;
  logic ALUASrc_ex;
RegistroGeneral RegALUASrc_ex(clk,1'b1, ~HDUStall | NextPCSrc_ex, ALUASrc_de,ALUASrc_ex);

/*RegALUBSrc_ex*/
//logic ALUBSrc_de;
  logic ALUBSrc_ex;
RegistroGeneral RegALUBSrc_ex(clk,1'b1, ~HDUStall | NextPCSrc_ex, ALUBSrc_de,ALUBSrc_ex);

/*RegALUOp_ex*/
//logic [3:0] ALUOp_de;
  logic [3:0] ALUOp_ex;
RegistroGeneral RegALUOp_ex(clk,1'b1,~HDUStall | NextPCSrc_ex, ALUOp_de,ALUOp_ex);

/*RegDMWr_ex*/
//logic DMWr_de;
  logic DMWr_ex;
RegistroGeneral RegDMWr_ex(clk,1'b1, ~HDUStall | NextPCSrc_ex, DMWr_de,DMWr_ex);

/*RegDMCtrl_ex*/
//logic [2:0] DMCtrl_de
  logic [2:0] DMCtrl_ex;
RegistroGeneral RegDMCtrl_ex(clk,1'b1,~HDUStall | NextPCSrc_ex,DMCtrl_de,DMCtrl_ex);

/*RegRUDatawrSrc_ex*/
//logic [1:0]  RUDatawrSrc_de;
  logic [1:0]  RUDatawrSrc_ex;
RegistroGeneral RegRUDatawrSrc_ex(clk,1'b1, ~HDUStall | NextPCSrc_ex, RUDatawrSrc_de,RUDatawrSrc_ex); 

/*RegRuWr_ex*/
//logic RuWr_de;
  logic RuWr_ex;
RegistroGeneral RegRuWr_ex(clk,1'b1,~HDUStall | NextPCSrc_ex,RuWr_de,RuWr_ex); 

/*RegBUOp_ex*/
//logic [4:0] BUOp_de;
  logic [4:0] BUOp_ex;
RegistroGeneral RegBUOp_ex(clk,1'b1,~HDUStall | NextPCSrc_ex,BUOp_de,BUOp_ex); 

/*RegDMrd_ex*/
//logic DMrd_de;
  logic DMrd_ex;
RegistroGeneral RegDMrd_ex(clk,1'b1,~HDUStall | NextPCSrc_ex,DMrd_de,DMrd_ex); 

//-------------------------------------------------------------------------------------

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

/*Regrs1_ex*/
//Inst_de[19:15];
  logic [4:0] rs1_ex;
RegistroGeneral Regrs1_ex (clk,1'b1,1'b0,Inst_de[19:15],rs1_ex);

/*Regrs2_ex*/
//Inst_de[24:20];
  logic [4:0] rs2_ex;
RegistroGeneral Regrs2_ex (clk,1'b1,1'b0,Inst_de[24:20],rs2_ex);

/*MuxFUASrc*/
//DataWr_wb;
//ALURes_me;
//RUrs1_ex;
  logic [1:0] FUASrc;
  logic [31:0] MuxFUA_output;
MuxFw MuxFUASrc(DataWr_wb,ALURes_me,RUrs1_ex,FUASrc,MuxFUA_output);

/*MuxFUBSrc*/
//DataWr_wb;
//ALURes_me;
//RUrs2_ex;
  logic [1:0] FUBSrc;
  logic [31:0] MuxFUB_output;
MuxFw MuxFUBSrc(DataWr_wb,ALURes_me,RUrs2_ex,FUBSrc,MuxFUB_output);

/*FUnit*/
//rs1_ex
//rs2_ex
//RuWr_me
//RuWr_wb
//logic FUASrc;
//logic FUBSrc;
FUnit FUnit(RuWr_me,RuWr_wb,rd_me,rd_wb,rs1_ex,rs2_ex,FUASrc,FUBSrc);


/*Branch Unit*/
//logic [4:0] BUOp_ex;
//logic NextPCSrc_ex;
BUnit InstBUnit (MuxFUA_output,MuxFUB_output,BUOp_ex,NextPCSrc_ex );

/*MUXA*/
//logic [31:0] PC_ex;
//logic ALUASrc_ex;
  logic [31:0] MUXA_output;
Mux2a1de32  MUXA(MuxFUA_output,PC_ex,ALUASrc_ex, MUXA_output);

/*MUXB*/
//logic [31:0] ImmExt_ex;
//logic ALUBSrc_ex;
  logic [31:0] MUXB_output;
Mux2a1de32  MUXB(MuxFUB_output,ImmExt_ex,ALUBSrc_ex,MUXB_output);

/*ALU*/
//logic [31:0] MUXA_output;
//logic [31:0] MUXB_output;
//logic [5:0] ALUOp_ex;
//logic [31:0] ALURes_output;
ALUop InstALUop (MUXA_output, MUXB_output, ALUOp_ex, ALURes_output );

/*REGISTROS MEMORY*/
//------------------------------------------------------------------------------

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

//----------------------------------------------------------------------------------

/*RegPCInc_me*/
//logic [31:0] PCInc_ex;
  logic [31:0] PCInc_me;
RegistroGeneral RegPCInc_me(clk,1'b1,1'b0,PCInc_ex,PCInc_me);

/*RegALURes_me*/ 
//logic [31:0] ALURes_output;
 logic [31:0] ALURes_me;
RegistroGeneral RegALURes_me(clk,1'b1,1'b0,ALURes_output,ALURes_me);

/*RegRUrs2_me*/
//logic [4:0] RUrs2_ex ;
  logic [31:0] RUrs2_me;
RegistroGeneral RegRUrs2_me(clk,1'b1,1'b0,RUrs2_ex,RUrs2_me);

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

/*REGISTROS WB*/
//---------------------------------------------------------------------------
/*RegRUDatawrSrc_wb*/
//logic [1:0]  RUDatawrSrc_me;
  logic [1:0]  RUDatawrSrc_wb;
RegistroGeneral RegRUDatawrSrc_wb(clk,1'b1,1'b0,RUDatawrSrc_me,RUDatawrSrc_wb);

/*RegRuWr_wb*/
//logic RuWr_me;
//logic RuWr_wb;
RegistroGeneral RegRuWr_wb(clk,1'b1,1'b0,RuWr_me,RuWr_wb);
//----------------------------------------------------------------------------


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