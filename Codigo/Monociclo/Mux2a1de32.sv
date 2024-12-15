module Mux2a1de32(A,B,Selec,S);
    input logic [31:0]   A ;    
    input logic [31:0]   B ;    
    input logic          Selec ;     
  output logic [31:0]  S = 0;
always_comb
    begin
        case (Selec)
            1'd0:  S <= A;
            1'd1:  S <= B;
            default: S <= A;
        endcase             
    end
endmodule

/*
module testbench;
	 logic [31:0]   A ;    
     logic [31:0]   B ;    
     logic          Selec ;     
     logic [31:0]  	S;

  Mux2a1de32 Multi(
    .A(A),
    .B(B),
    .Selec(Selec),
    .S(S));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    A = 0;
    B = 1;
	Selec = 0;
    repeat (10)
        #5 Selec = ~ Selec;
    
    #150
    $finish;
  end
endmodule*/