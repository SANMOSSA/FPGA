module VRAm(Fila,Columna,dy,letra,Pixel);
	input  logic [10:0] Fila;
	input  logic [10:0] Columna;
	input  logic [7:0] dy;
	input  logic [9:0] letra[9:0];
	output logic [23:0] Pixel;

	logic [0:640-1]mem[0:480-1];
  
	initial 
	begin
		$readmemb ("VRAm.txt",mem);
	end

	always_comb
	begin
		Pixel <= mem[Fila][Columna];	
	end
	
	always_comb
	begin
		mem[0 + dy*10][30:39] <= letra[0];
		mem[1 + dy*10][30:39] <= letra[1];
		mem[2 + dy*10][30:39] <= letra[2];
		mem[3 + dy*10][30:39] <= letra[3];
		mem[4 + dy*10][30:39] <= letra[4];
		mem[5 + dy*10][30:39] <= letra[5];
		mem[6 + dy*10][30:39] <= letra[6];
		mem[7 + dy*10][30:39] <= letra[7];
		mem[8 + dy*10][30:39] <= letra[8];
		mem[9 + dy*10][30:39] <= letra[9];
	end
endmodule