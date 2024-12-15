module PS2(
  input logic clk,
  input logic data,
  output logic [7:0] ascii
);
  logic [4:0] cont;
  logic [9:0] dat;

  initial begin
    cont <= 0;
    ascii <= 0;
  end

  always @(negedge clk)
  begin
    if(cont < 10)
	 begin
      dat[cont] <= data;
      cont <= cont + 1;
    end
    else begin
      cont <= 0;
      ascii <= dat[8:1];
    end
  end
endmodule