`include "Deco532.sv"
`include "Multiplexor.sv"

module RUnit (clk,RUDataWr,rd,rs1,rs2,RuWr,RUrs1,RUrs2);
  
  input logic clk;
  input logic [31:0] RUDataWr;
  input logic [4:0] rd;
  input logic [4:0] rs1;
  input logic [4:0] rs2;
  input logic RuWr;
  output logic [31:0] RUrs1;
  output logic [31:0] RUrs2;
  
    logic [31:0] SX0 = 0;    
    logic [31:0] SX1 = 0;    
    logic [31:0] SX2 = 10'd1023;     
    logic [31:0] SX3 = 0;    
    logic [31:0] SX4 = 0;    
    logic [31:0] SX5 = 0;    
    logic [31:0] SX6 = 0;    
    logic [31:0] SX7 = 0;    
    logic [31:0] SX8 = 0;    
    logic [31:0] SX9 = 0;    
    logic [31:0] SX10 = 0;    
    logic [31:0] SX11 = 0;    
    logic [31:0] SX12 = 0;    
    logic [31:0] SX13 = 0;    
    logic [31:0] SX14 = 0;    
    logic [31:0] SX15 = 0;    
    logic [31:0] SX16 = 0;
    logic [31:0] SX17 = 0;
    logic [31:0] SX18 = 0; 
    logic [31:0] SX19 = 0;
    logic [31:0] SX20 = 0;    
    logic [31:0] SX21 = 0;    
    logic [31:0] SX22 = 0; 
    logic [31:0] SX23 = 0; 
    logic [31:0] SX24 = 0; 
    logic [31:0] SX25 = 0; 
    logic [31:0] SX26 = 0; 
    logic [31:0] SX27 = 0; 
    logic [31:0] SX28 = 0; 
    logic [31:0] SX29 = 0; 
    logic [31:0] SX30 = 0; 
    logic [31:0] SX31 = 0;  
  
    logic [31:0] SDeco;
  
  always_ff @ (negedge clk)
    begin
        if(SDeco[0])
             SX0 <= RUDataWr;
        if(SDeco[1])
             SX1 <= RUDataWr;
        if(SDeco[2])
             SX2 <= RUDataWr;
        if(SDeco[3])
             SX3 <= RUDataWr;
        if(SDeco[4])
             SX4 <= RUDataWr;
        if(SDeco[5])
             SX5 <= RUDataWr;
        if(SDeco[6])
             SX6 <= RUDataWr;
        if(SDeco[7])
             SX7 <= RUDataWr;
        if(SDeco[8])
             SX8 <= RUDataWr;
        if(SDeco[9])
             SX9 <= RUDataWr;
        if(SDeco[10])
             SX10 <= RUDataWr;
        if(SDeco[11])
             SX11 <= RUDataWr;
        if(SDeco[12])
             SX12 <= RUDataWr;
        if(SDeco[13])
             SX13 <= RUDataWr;
        if(SDeco[14])
             SX14 <= RUDataWr;
        if(SDeco[15])
             SX15 <= RUDataWr;
        if(SDeco[16])
             SX16 <= RUDataWr;
        if(SDeco[17])
             SX17 <= RUDataWr;
        if(SDeco[18])
             SX18 <= RUDataWr;
        if(SDeco[19])
             SX19 <= RUDataWr;
        if(SDeco[20])
             SX20 <= RUDataWr;
        if(SDeco[21])
             SX21 <= RUDataWr;
        if(SDeco[22])
             SX22 <= RUDataWr;
        if(SDeco[23])
             SX23 <= RUDataWr;
        if(SDeco[24])
             SX24 <= RUDataWr;
        if(SDeco[25])
             SX25 <= RUDataWr;
        if(SDeco[26])
             SX26 <= RUDataWr;
        if(SDeco[27])
             SX27 <= RUDataWr;
        if(SDeco[28])
             SX28 <= RUDataWr;
        if(SDeco[29])
             SX29 <= RUDataWr;
        if(SDeco[30])
             SX30 <= RUDataWr;
        if(SDeco[31])
             SX31 <= RUDataWr;
    end
  
  Deco532 instDeco5_32(rd,RuWr,SDeco);
  Multiplexor instmultiA (rs1,RUrs1,SX0, SX1, SX2,SX3,SX4,SX5,SX6,SX7,
                            SX8,SX9,SX10,SX11,SX12,SX13,SX14,SX15,
                            SX16,SX17,SX18,SX19,SX20,SX21,SX22,SX23,SX24,
                            SX25,SX26,SX27,SX28,SX29,SX30,SX31);
  Multiplexor instmultiB (rs2,RUrs2,SX0, SX1, SX2,SX3,SX4,SX5,SX6,SX7,
                            SX8,SX9,SX10,SX11,SX12,SX13,SX14,SX15,
                            SX16,SX17,SX18,SX19,SX20,SX21,SX22,SX23,SX24,
                            SX25,SX26,SX27,SX28,SX29,SX30,SX31);

  
   
  
endmodule