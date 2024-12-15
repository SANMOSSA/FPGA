module Mux3a1de32(PCInc,datard,ALUS,RUDatawrSrc,RUDataWr);
    input logic [31:0]   PCInc ;    
    input logic [31:0]   datard ;   
    input logic [31:0]   ALUS ;   
    input logic  [1:0]   RUDatawrSrc ;     
    output logic [31:0]  RUDataWr;
always_comb
    begin
      	case (RUDatawrSrc)
            2'b10:  RUDataWr <= PCInc;
            2'b01:  RUDataWr <= datard;
            2'b00:  RUDataWr <= ALUS;
            default: RUDataWr <= PCInc;
        endcase             
    end
endmodule


/*
module testbench;
	 logic [31:0]   PCInc ;    
     logic [31:0]   datard ;  
  	 logic [31:0]   ALUS ;  
 	 logic  [1:0]   RUDatawrSrc ;     
     logic [31:0]  	RUDataWr;

  Mux3a1de32 Multi(
    .PCInc(PCInc),
    .datard(datard),
    .ALUS(ALUS),
    .RUDatawrSrc(RUDatawrSrc),
    .RUDataWr(RUDataWr));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    PCInc = 31'd0;
    datard = 31'd1;
    ALUS = 31'd3;
	RUDatawrSrc = 2'd2;
    repeat (10)
      begin
        #5;
        case (RUDatawrSrc)
            2'd0:  RUDatawrSrc = 1;
            2'd1:  RUDatawrSrc = 2;
            2'd2:  RUDatawrSrc = 0;
            default: RUDatawrSrc = 0;
        endcase
      end
    
    #150
    $finish;
  end
endmodule*/