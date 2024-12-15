module FONT_Rom(ascii,letra);
  input  logic [8:0] ascii;
  output logic [99:0] letra;
  
  logic [0:100-1]mem[0:200-1] ;
		
  always_comb
   begin
		$readmemb ("Font.txt",mem);
      letra <= mem[ascii];	
   end
endmodule