module BUnit(rs1,rs2,BUOp,NextPCSrc);
    input logic [31:0]   rs1 ;    
    input logic [31:0]   rs2 ;   
    input logic  [4:0]   BUOp ;     
    output logic NextPCSrc = 0;

    wire signed [31:0] n1;
    wire signed [31:0] n2;

    assign n1 = rs1;
    assign n2 = rs2;
    
    always_comb
        begin
          if (BUOp[4:3] == 2'b00)
            NextPCSrc <= 0;
          if (BUOp[4] == 1'b1)
            NextPCSrc <= 1;
          else
            begin
            case (BUOp)
                5'b01000: begin if (rs1 == rs2)
                                    NextPCSrc <= 1;
                  				else
                                  NextPCSrc <= 0;
                            end
                5'b01001: begin if (rs1 != rs2)
                                    NextPCSrc <= 1;
                                else
                                  NextPCSrc <= 0;
                            end
                5'b01100: begin if (n1 < n2)
                                    NextPCSrc <= 1;
                                else
                                  NextPCSrc <= 0;
                            end
                5'b01101: begin if (n1 >= n2)
                                    NextPCSrc <= 1;
                                else
                                  NextPCSrc <= 0;
                            end  
                5'b01110: begin if (rs1 < rs2)
                                    NextPCSrc <= 1;
                                else
                                  NextPCSrc <= 0;
                            end 
                5'b01111: begin if (rs1 >= rs2)
                                    NextPCSrc <= 1;
                                else
                                  NextPCSrc <= 0;
                            end          
                default: NextPCSrc <= 0;
            endcase  
            end
        end
endmodule


/*
module testbench;
	 logic [31:0] rs1 ;       
     logic [31:0] rs2;
   	 logic  [4:0] BUOp;
     logic NextPCSrc;

  BUnit saltador(
    .rs1(rs1),
    .rs2(rs2),
    .BUOp(BUOp),
    .NextPCSrc(NextPCSrc));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    rs1 = 32'd18;
    rs2 = 32'd50;
    BUOp = 5'b00111;
    repeat (16)
      begin
        #15;
        if (BUOp[4:3] == 2'b00)
            BUOp <= 5'b10000;
        if (BUOp[4] == 1'b1)
            BUOp <= 5'b01000;
        else
            begin
            case (BUOp)
                5'b01000: BUOp <= 5'b01001;
                5'b01001: BUOp <= 5'b01100;
                5'b01100: BUOp <= 5'b01101;
                5'b01101: BUOp <= 5'b01110;
                5'b01110: BUOp <= 5'b01111;
                5'b01111: BUOp <= 5'b00001;
            endcase
         end
      end
    $finish;
  end
endmodule*/