module HDUnit(rs1,rs2,rd,DMrd,HDUStall);
  input   logic   [4:0]  rs1;    
  input   logic   [4:0]  rs2;   
  input   logic   [4:0]  rd;   
  input   logic          DMrd;     
  output  logic          HDUStall;

always_comb
    begin 
        if (DMrd & ((rs1 == rd) | (rs2 == rd)))
            HDUStall = 1'b0;
        else
            HDUStall = 1'b1;
    end
endmodule