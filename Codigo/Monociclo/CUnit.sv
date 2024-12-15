module CUnit(OpCode,Funct3,Funct7, ImmSrc,ALUASrc,ALUBSrc,ALUOp,DMWr,DMCtrl,RUDatawrSrc,RuWr,BUOp);
    input logic [6:0]   OpCode ;    
    input logic [2:0]   Funct3 ;   
  	input logic [6:0]   Funct7 ;     

    output logic [2:0]  ImmSrc;
    output logic        ALUASrc;
    output logic        ALUBSrc;
    output logic [3:0]  ALUOp;
    output logic        DMWr;
    output logic [2:0]  DMCtrl;
    output logic [1:0]  RUDatawrSrc;
    output logic        RuWr;
    output logic [4:0]  BUOp;
    
    always_comb
        begin
            case (OpCode)
/*Tipo R*/      7'b0110011: begin 
                            ImmSrc      <= 3'b000;
                            ALUASrc     <= 1'b0;
                            ALUBSrc     <= 1'b0;
                            ALUOp       <= {Funct7[5],Funct3};
                            DMWr        <= 1'b0;
                            DMCtrl      <= 3'b000;
                            RUDatawrSrc <= 2'b00;
                            RuWr        <= 1'b1;
                            BUOp        <= 5'b00000;
                            end
/*Tipo I*/      7'b0010011: begin 
                            ImmSrc      <= 3'b000;
                            ALUASrc     <= 1'b0;
                            ALUBSrc     <= 1'b1;
  							            if (Funct3 == 3'b101)
                            	  ALUOp   <= {Funct7[5],Funct3};
 							              else
                                ALUOp   <= {1'b0,Funct3};
                            DMWr        <= 1'b0;
                            DMCtrl      <= 3'b000;
                            RUDatawrSrc <= 2'b00;
                            RuWr        <= 1'b1;
                            BUOp        <= 5'b00000;
                            end
/*Tipo L*/      7'b0000011: begin
                            ImmSrc      <= 3'b000;
                            ALUASrc     <= 1'b0;
                            ALUBSrc     <= 1'b1;
                            ALUOp       <= 4'b0000;
                            DMWr        <= 1'b0;
                            DMCtrl      <= Funct3;
                            RUDatawrSrc <= 2'b01;
                            RuWr        <= 1'b1;
                            BUOp        <= 5'b00000; 
                            end
/*Tipo jalr*/   7'b1100111: begin 
                            ImmSrc      <= 3'b000;
                            ALUASrc     <= 1'b0;
                            ALUBSrc     <= 1'b1;
                            ALUOp       <= 4'b0000;
                            DMWr        <= 1'b0;
                            DMCtrl      <= 3'b000;
                            RUDatawrSrc <= 2'b00;
                            RuWr        <= 1'b0;
                            BUOp        <= 5'b10000;
                            end  
/*Tipo B*/      7'b1100011: begin 
                            ImmSrc      <= 3'b101;
                            ALUASrc     <= 1'b1;
                            ALUBSrc     <= 1'b1;
                            ALUOp       <= 4'b0000;
                            DMWr        <= 1'b0;
                            DMCtrl      <= 3'b000;
                            RUDatawrSrc <= 2'b00;
                            RuWr        <= 1'b0;
                            BUOp        <= {2'b01,Funct3}; 
                            end
/*Tipo S*/      7'b0100011: begin
                            ImmSrc      <= 3'b001;
                            ALUASrc     <= 1'b0;
                            ALUBSrc     <= 1'b1;
                            ALUOp       <= 4'b0000;
                            DMWr        <= 1'b1;
                            DMCtrl      <= Funct3;
                            RUDatawrSrc <= 2'b00;
                            RuWr        <= 1'b0;
                            BUOp        <= 5'b00000; 
                            end     
/*Tipo jal*/    7'b1101111: begin 
                            ImmSrc      <= 3'b110;
                            ALUASrc     <= 1'b1;
                            ALUBSrc     <= 1'b1;
                            ALUOp       <= 4'b0000;
                            DMWr        <= 1'b0;
                            DMCtrl      <= 3'b000;
                            RUDatawrSrc <= 2'b10;
                            RuWr        <= 1'b1;
                            BUOp        <= 5'b10000;  
                            end 
/*Tipo User*/   //7'b1010101:   
                default: begin
                        ImmSrc      <= 3'b010;
                        ALUASrc     <= 1'b1;
                        ALUBSrc     <= 1'b1;
                        ALUOp       <= 4'b0000;
                        DMWr        <= 1'b0;
                        DMCtrl      <= 3'b111;
                        RUDatawrSrc <= 2'b00;
                        RuWr        <= 1'b0;
                        BUOp        <= 5'b00000;  
                        end 
            endcase  
        end
endmodule