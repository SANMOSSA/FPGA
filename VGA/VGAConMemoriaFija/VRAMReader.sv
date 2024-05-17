module VRAMReader(Fila,Columna,Pixel);
	input  logic [10:0] Fila; // Pocion en la memoria de video en la fila, tamaño maximo de 2^11 = 2048
	input  logic [10:0] Columna; // Pocion en la memoria de video en la columna, tamaño maximo de 2^11 = 2048
	output logic Pixel;
	
	
	parameter HTime = 794, VTime = 523 ;
  	reg [0:HTime-1]mem[0:VTime-1];

	always_comb
	begin
		$readmemb("VRAMContent.txt", mem);
		Pixel <= mem[Fila][Columna];
	end
endmodule

