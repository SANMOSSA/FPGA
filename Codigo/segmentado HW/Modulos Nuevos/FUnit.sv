module FUnit(RUWr_me,RUWr_wb,rd_me,rd_wb,rs1_ex,rs2_ex,FUASrc,FUBSrc);
  input logic RUWr_me;
  input logic RUWr_wb;
  input logic [4:0]rd_me;
  input logic [4:0]rd_wb;
  input logic [4:0]rs1_ex;
  input logic [4:0]rs2_ex;
  output logic [1:0]FUASrc;
  output logic [1:0]FUBSrc;

always_comb 
  begin 
    if(RUWr_me & rd_me == rs1_ex)
      FUASrc=2'b10;
    else if(RUWr_wb & rd_wb == rs1_ex)
        FUASrc=2'b11;
    else
        FUASrc=2'b00;
    end

always_comb 
  begin 
    if(RUWr_me & rd_me == rs2_ex)
      FUBSrc=2'b10;
    else if(RUWr_wb & rd_wb == rs2_ex)
        FUBSrc=2'b11;
    else
        FUBSrc=2'b00;
    end
endmodule


/*module FUnit_tb;
   logic RUWr_me;
   logic RUWr_wb;
   logic [4:0]rd_me;
   logic [4:0]rd_wb;
   logic [4:0]rs1_ex;
   logic [4:0]rs2_ex;
   logic [1:0]FUASrc;
   logic [1:0]FUBSrc;

  
   FUnit FUnitinst(
        .RUWr_me(RUWr_me),
     	.RUWr_wb(RUWr_wb),
     	.rd_me(rd_me),
   		.rd_wb(rd_wb),
     	.rs1_ex(rs1_ex),
     	.rs2_ex(rs2_ex),
     	.FUASrc(FUASrc),
     	.FUBSrc(FUBSrc));
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    RUWr_me = 0;
    RUWr_wb = 1;
    rd_me = 3'b101;
    rd_wb = 0;
    rs1_ex = 3'b101;
    rs2_ex = 0;
    repeat(9) begin
      #15
      RUWr_me = ~RUWr_me;
    end
    $finish;
  	end
endmodule*/