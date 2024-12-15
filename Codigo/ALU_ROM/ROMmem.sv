
module ROMmem(adres,clk,data);
  input logic [7:0]adres;
  input logic clk;
  output logic [19:0]data;

  logic [19:0] mem [255:0];
  always_ff@(posedge clk)
    begin
      if(1'b1 == 1'b1)
        begin
          $readmemh ("ROM.hex",mem);
          data = mem[adres];
        end
      end
endmodule
