module FONT_Rom(ascii,letra);
  input  logic [8:0] ascii;
  output logic [9:0] letra[9:0];
  
  logic [0:100-1]mem[0:200-1] ;
  
  always_comb
   begin
		$readmemb ("Font.txt",mem);
      letra[0] <= mem[ascii][0:9];
		letra[1] <= mem[ascii][10:19];
		letra[2] <= mem[ascii][20:29];
		letra[3] <= mem[ascii][30:39];
		letra[4] <= mem[ascii][40:49];
		letra[5] <= mem[ascii][50:59];
		letra[6] <= mem[ascii][60:69];
		letra[7] <= mem[ascii][70:79];
		letra[8] <= mem[ascii][80:89];
		letra[9] <= mem[ascii][90:99];
   end
endmodule