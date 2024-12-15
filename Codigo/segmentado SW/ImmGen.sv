module ImmGen(Imm,ImmSrc,ImmExt);
    input logic [31-7:0]Imm ;    
    input logic [2:0]   ImmSrc ;  
    output logic [31:0] ImmExt = 0;

    always_comb
        begin
            case (ImmSrc)
                3'b000: begin 
                        if (Imm[31-7] == 0)
                            ImmExt <= Imm[31-7:20-7];
                        else
                            ImmExt <= {20'hfffff,Imm[31-7:20-7]};
                        end
                3'b001: begin 
                        if (Imm[31-7] == 0)
                            ImmExt <= {Imm[31-7:25-7],Imm[11-7:7-7]};
                        else
                            ImmExt <= {3'b111,16'hffff,Imm[31-7:25-7],Imm[11-7:7-7]};
                        end
                3'b101: begin 
                        if (Imm[31-7] == 0)
                            ImmExt <= {Imm[31-7],Imm[7-7],Imm[30-7:25-7],Imm[11-7:8-7],1'b0};
                        else
                            ImmExt <= {3'b111,16'hffff,Imm[31-7],Imm[7-7],Imm[30-7:25-7],Imm[11-7:8-7],1'b0};
                        end
                3'b010: begin 
                        if (Imm[31-7] == 0)
                            ImmExt <= {Imm[31-7],Imm[19-7:12-7],Imm[20-7],Imm[30-7:21-7],1'b0};
                        else
                            ImmExt <= {12'hfff,Imm[31-7],Imm[19-7:12-7],Imm[20-7],Imm[30-7:21-7],1'b0};
                        end
                3'b110: begin 
                        if (Imm[31-7] == 0)
                            ImmExt <= {Imm[31-7],Imm[19-7:12-7],Imm[20-7],Imm[30-7:21-7],1'b0};
                        else
                            ImmExt <= {3'b111,8'hff,Imm[31-7],Imm[19-7:12-7],Imm[20-7],Imm[30-7:21-7],1'b0};
                        end      
                default: ImmExt <= 0;
            endcase  
        end
endmodule
/*
module testbench;
	 logic [31-7:0] Imm ;       
     logic [2:0] ImmSrc;
  logic  [31:0] ImmExt;

  ImmGen saltador(
    .Imm(Imm),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    Imm = 25'b1010100011010101010100100;
    ImmSrc = 3'b000;
    repeat (10)
      begin
        #15;
        case (ImmSrc)
          3'b000: ImmSrc <= 3'b001;
          3'b001: ImmSrc <= 3'b101;
          3'b101: ImmSrc <= 3'b010;
          3'b010: ImmSrc <= 3'b110;
          3'b110: ImmSrc <= 3'b000;
        endcase
      end
    $finish;
  end
endmodule*/