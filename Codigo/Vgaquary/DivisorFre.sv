module DivisorFre(
input clk, 
output reg clk_out);

parameter frecuencia = 50000000;
parameter freq_out	= 25000000;
parameter max_count=frecuencia/(2*freq_out);
reg [25:0] count; 
initial 
begin
	count = 0;
	clk_out=0;
end

always @(posedge clk) 
begin
	if (count==(max_count)) 
	begin
		clk_out =~clk_out; 
		count = 0;
	end
	else
	begin
		count = count +1;
	end
end
endmodule