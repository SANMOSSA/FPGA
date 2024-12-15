module RegistroGeneral(clk,En,Clr,inputReg,outputReg);
  input   logic           clk;    
  input   logic           En;   
  input   logic           Clr;   
  input   logic   [31:0]  inputReg;     
  output  logic   [31:0]  outputReg;

always_ff @ (posedge clk)
  if (En)
    if (Clr)
      outputReg = 0;
    else 
      outputReg = inputReg;
endmodule
10101010
01010101