module MuxFw(A,B,C,Selec,Salida);
    input logic [31:0]   A ;    
    input logic [31:0]   B ;   
    input logic [31:0]   C ;   
    input logic  [1:0]   Selec ;     
    output logic [31:0]  Salida;
always_comb
    begin
      	case (Selec)
            2'b11:  Salida <= A;
            2'b10:  Salida <= B;
            2'b00:  Salida <= C;
            default: Salida <= A;
        endcase             
    end
endmodule


/*
module testbench;
	 logic [31:0]   A ;    
     logic [31:0]   B ;  
  	 logic [31:0]   C ;  
 	 logic  [1:0]   Selec ;     
     logic [31:0]  	Salida;

  MuxFw Multi(
    .A(A),
    .B(B),
    .C(C),
    .Selec(Selec),
    .Salida(Salida));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    A = 31'd0;
    B = 31'd1;
    C = 31'd3;
	Selec = 2'd2;
    repeat (10)
      begin
        #5;
        case (Selec)
            2'd0:  Selec = 1;
            2'd1:  Selec = 2;
            2'd2:  Selec = 0;
            default: Selec = 0;
        endcase
      end
    
    #150
    $finish;
  end
endmodule*/