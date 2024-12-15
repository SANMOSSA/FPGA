module IMmem(address,Inst);
  input  logic [31:0] address;
  output logic [31:0] Inst;
  localparam Tamano = (2**10) - 1;
  logic [7:0] mem [Tamano:0];
  always_comb
    begin
      $readmemb ("IM.txt",mem);
      	Inst = {mem[address],mem[address+1],mem[address+2],mem[address+3]};	
      end
endmodule

/*
module testbench;
	 logic [31:0] address ;       
     logic [31:0] Inst;

  IMmem Multi(
    .address(address),
    .Inst(Inst));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    address = 32'd0;
    repeat (3)
      begin
        #5;
        address+=4;
      end
    #150
    $finish;
  end
endmodule
*/