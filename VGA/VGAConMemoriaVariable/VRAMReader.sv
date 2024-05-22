module VRAMReader(Fila,Columna,Pixel,Region,Letra);
    input logic Region;      // Selecciona la región de la pantalla que va a modificar 4 regiones
    input logic Letra;       // Selecciona la letra a mostrar
	input  logic [10:0] Fila; // Pocion en la memoria de video en la fila, tamaño maximo de 2^11 = 2048
	input  logic [10:0] Columna; // Pocion en la memoria de video en la columna, tamaño maximo de 2^11 = 2048
	output logic Pixel;
	
	
	logic [3:0]SelectorLetra = 0;
	logic [1:0]SelectorRegion = 0;
	
	parameter HTime = 794, VTime = 523, FontHTime = 150 ;

	reg [0:FontHTime-1]MemRegion0[0:VTime-1];
	reg [0:FontHTime-1]MemRegion1[0:VTime-1];
	reg [0:FontHTime-1]MemRegion2[0:VTime-1];
	reg [0:FontHTime-1]MemRegion3[0:VTime-1];


	

	always @(negedge Letra)
	begin
		SelectorLetra <= SelectorLetra + 1;
		if (SelectorLetra == 16)
			SelectorLetra <= 0;
	end

	always @(negedge Region)
	begin
		SelectorRegion <= SelectorRegion + 1;
		if (SelectorRegion == 4)
			SelectorRegion <= 0;
	end
	
	// always_comb
	// begin
		
		
			
	// end
	
	always_comb
	begin
		$readmemb("0.txt",MemRegion0);
		$readmemb("1.txt",MemRegion1);
		$readmemb("2.txt",MemRegion2);
		$readmemb("3.txt",MemRegion3);

		
		case (SelectorRegion)
			0: begin
				case (SelectorLetra)
					0: $readmemb("0.txt",MemRegion0) ;
					1: $readmemb("1.txt",MemRegion0) ;
					2: $readmemb("2.txt",MemRegion0) ;
					3: $readmemb("3.txt",MemRegion0) ;
					4: $readmemb("4.txt",MemRegion0) ;
					5: $readmemb("5.txt",MemRegion0) ;
					6: $readmemb("6.txt",MemRegion0) ;
					7: $readmemb("7.txt",MemRegion0) ;
					8: $readmemb("8.txt",MemRegion0) ;
					9: $readmemb("9.txt",MemRegion0) ;
					10: $readmemb("A.txt",MemRegion0) ;
					11: $readmemb("B.txt",MemRegion0) ;
					12: $readmemb("C.txt",MemRegion0) ;
					13: $readmemb("D.txt",MemRegion0) ;
					14: $readmemb("E.txt",MemRegion0) ;
					15: $readmemb("F.txt",MemRegion0) ;
					default: $readmemb("0.txt",MemRegion0) ; 
				endcase
				end
			1: begin
				case (SelectorLetra)
					0: $readmemb("0.txt",MemRegion1) ;
					1: $readmemb("1.txt",MemRegion1) ;
					2: $readmemb("2.txt",MemRegion1) ;
					3: $readmemb("3.txt",MemRegion1) ;
					4: $readmemb("4.txt",MemRegion1) ;
					5: $readmemb("5.txt",MemRegion1) ;
					6: $readmemb("6.txt",MemRegion1) ;
					7: $readmemb("7.txt",MemRegion1) ;
					8: $readmemb("8.txt",MemRegion1) ;
					9: $readmemb("9.txt",MemRegion1) ;
					10: $readmemb("A.txt",MemRegion1) ;
					11: $readmemb("B.txt",MemRegion1) ;
					12: $readmemb("C.txt",MemRegion1) ;
					13: $readmemb("D.txt",MemRegion1) ;
					14: $readmemb("E.txt",MemRegion1) ;
					15: $readmemb("F.txt",MemRegion1) ;
					default: $readmemb("0.txt",MemRegion1) ; 
				endcase
				end
			2: begin
				case (SelectorLetra)
					0: $readmemb("0.txt",MemRegion2) ;
					1: $readmemb("1.txt",MemRegion2) ;
					2: $readmemb("2.txt",MemRegion2) ;
					3: $readmemb("3.txt",MemRegion2) ;
					4: $readmemb("4.txt",MemRegion2) ;
					5: $readmemb("5.txt",MemRegion2) ;
					6: $readmemb("6.txt",MemRegion2) ;
					7: $readmemb("7.txt",MemRegion2) ;
					8: $readmemb("8.txt",MemRegion2) ;
					9: $readmemb("9.txt",MemRegion2) ;
					10: $readmemb("A.txt",MemRegion2) ;
					11: $readmemb("B.txt",MemRegion2) ;
					12: $readmemb("C.txt",MemRegion2) ;
					13: $readmemb("D.txt",MemRegion2) ;
					14: $readmemb("E.txt",MemRegion2) ;
					15: $readmemb("F.txt",MemRegion2) ;
					default: $readmemb("0.txt",MemRegion2) ; 
				endcase
				end
			3: begin
				case (SelectorLetra)
					0: $readmemb("0.txt",MemRegion3) ;
					1: $readmemb("1.txt",MemRegion3) ;
					2: $readmemb("2.txt",MemRegion3) ;
					3: $readmemb("3.txt",MemRegion3) ;
					4: $readmemb("4.txt",MemRegion3) ;
					5: $readmemb("5.txt",MemRegion3) ;
					6: $readmemb("6.txt",MemRegion3) ;
					7: $readmemb("7.txt",MemRegion3) ;
					8: $readmemb("8.txt",MemRegion3) ;
					9: $readmemb("9.txt",MemRegion3) ;
					10: $readmemb("A.txt",MemRegion3) ;
					11: $readmemb("B.txt",MemRegion3) ;
					12: $readmemb("C.txt",MemRegion3) ;
					13: $readmemb("D.txt",MemRegion3) ;
					14: $readmemb("E.txt",MemRegion3) ;
					15: $readmemb("F.txt",MemRegion3) ;
					default: $readmemb("0.txt",MemRegion3) ; 
				endcase
				end
			default: begin
						$readmemb("0.txt",MemRegion0);
						$readmemb("1.txt",MemRegion1);
						$readmemb("2.txt",MemRegion2);
						$readmemb("3.txt",MemRegion3);

					end
		endcase

		// si la Columna esta entre 150 y 300 entonces se selecciona la region 0
		// si la Columna esta entre 300 y 450 entonces se selecciona la region 1
		// si la Columna esta entre 450 y 600 entonces se selecciona la region 2
		// si la Columna esta entre 600 y 750 entonces se selecciona la region 3

		if (Columna >= 150 && Columna < 300)
			Pixel <= MemRegion0[Fila][Columna-150];
		else if (Columna >= 300 && Columna < 450)
			Pixel <= MemRegion1[Fila][Columna - 300];
		else if (Columna >= 450 && Columna < 600)
			Pixel <= MemRegion2[Fila][Columna - 450];
		else if (Columna >= 600 && Columna < 750)
			Pixel <= MemRegion3[Fila][Columna - 600];
		else
			Pixel <= 0;		
	end

endmodule

