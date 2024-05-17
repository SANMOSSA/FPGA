module VRAMReader(Fila,Columna,Pixel,Pulsador);
	input  logic Pulsador;
	input  logic [10:0] Fila; // Pocion en la memoria de video en la fila, tamaño maximo de 2^11 = 2048
	input  logic [10:0] Columna; // Pocion en la memoria de video en la columna, tamaño maximo de 2^11 = 2048
	output logic Pixel;
	
	
	logic [3:0]Selector;
	
	parameter HTime = 794, VTime = 523 ;
  	reg [0:HTime-1]mem[0:VTime-1];
	
	reg [0:HTime-1]Mem0[0:VTime-1];
	reg [0:HTime-1]Mem1[0:VTime-1];
	reg [0:HTime-1]Mem2[0:VTime-1];
	reg [0:HTime-1]Mem3[0:VTime-1];
	reg [0:HTime-1]Mem4[0:VTime-1];
	reg [0:HTime-1]Mem5[0:VTime-1];
	reg [0:HTime-1]Mem6[0:VTime-1];
	reg [0:HTime-1]Mem7[0:VTime-1];
	reg [0:HTime-1]Mem8[0:VTime-1];
	reg [0:HTime-1]Mem9[0:VTime-1];
	reg [0:HTime-1]MemA[0:VTime-1];
	reg [0:HTime-1]MemB[0:VTime-1];
	reg [0:HTime-1]MemC[0:VTime-1];
	reg [0:HTime-1]MemD[0:VTime-1];
	reg [0:HTime-1]MemE[0:VTime-1];
	reg [0:HTime-1]MemF[0:VTime-1];
	

	always @(negedge Pulsador)
	begin
		Selector <= Selector + 1;
		if (Selector == 16)
			Selector <= 0;
	end

	
	always_comb
	begin
		$readmemb("(0).txt", Mem0);
		$readmemb("(1).txt", Mem1);
		$readmemb("(2).txt", Mem2);
		$readmemb("(3).txt", Mem3);
		$readmemb("(4).txt", Mem4);
		$readmemb("(5).txt", Mem5);
		$readmemb("(6).txt", Mem6);
		$readmemb("(7).txt", Mem7);
		$readmemb("(8).txt", Mem8);
		$readmemb("(9).txt", Mem9);
		$readmemb("(A).txt", MemA);
		$readmemb("(B).txt", MemB);
		$readmemb("(C).txt", MemC);
		$readmemb("(D).txt", MemD);
		$readmemb("(E).txt", MemE);
		$readmemb("(F).txt", MemF);
		$readmemb ("VRAMContent.txt",mem);
		case (Selector) 
			0: Pixel <= Mem0[Fila][Columna];
			1: Pixel <= Mem1[Fila][Columna];
			2: Pixel <= Mem2[Fila][Columna];
			3: Pixel <= Mem3[Fila][Columna];
			4: Pixel <= Mem4[Fila][Columna];
			5: Pixel <= Mem5[Fila][Columna];
			6: Pixel <= Mem6[Fila][Columna];
			7: Pixel <= Mem7[Fila][Columna];
			8: Pixel <= Mem8[Fila][Columna];
			9: Pixel <= Mem9[Fila][Columna];
			10: Pixel <= MemA[Fila][Columna];
			11: Pixel <= MemB[Fila][Columna];
			12: Pixel <= MemC[Fila][Columna];
			13: Pixel <= MemD[Fila][Columna];
			14: Pixel <= MemE[Fila][Columna];
			15: Pixel <= MemF[Fila][Columna];
			default: Pixel <= mem[Fila][Columna];	
		endcase
		
	end
endmodule

