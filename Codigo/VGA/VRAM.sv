module VRAm(Fila,Columna,Pixel);
  input  logic [10:0] Fila;
  input  logic [10:0] Columna;
  output logic [23:0] Pixel;
  
  logic [0:640-1]mem[0:480-1] ;
  		

  always_comb
   begin
		$readmemb ("VRAm.txt",mem);
      Pixel <= mem[Fila][Columna];	
   end
endmodule