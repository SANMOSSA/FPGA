module DecodificadorHijo(numero4,numdecS);
  input logic [3:0] numero4;  
  output logic signed [6:0] numdecS; 

/*	   0
     -----
    |	    |
   5|	    |1
    |  6  |
     -----
    |	    |
   4|	    |2
    |  3  |
     -----
esquema 7 segmentos
*/

always_comb
    begin
      case (numero4)
            4'h0: numdecS <= ~ 7'b0111111;
            4'h1: numdecS <= ~ 7'b0000110;
            4'h2: numdecS <= ~ 7'b1011011; 
            4'h3: numdecS <= ~ 7'b1001111;
            4'h4: numdecS <= ~ 7'b1100110;
            4'h5: numdecS <= ~ 7'b1101101;
            4'h6: numdecS <= ~ 7'b1111101;
            4'h7: numdecS <= ~ 7'b0000111;
            4'h8: numdecS <= ~ 7'b1111111;
            4'h9: numdecS <= ~ 7'b1101111;
            4'hA: numdecS <= ~ 7'b1110111;
            4'hB: numdecS <= ~ 7'b1111100;
            4'hC: numdecS <= ~ 7'b0111001;
            4'hD: numdecS <= ~ 7'b1011110;
            4'hE: numdecS <= ~ 7'b1111001;
            4'hF: numdecS <= ~ 7'b1110001;
        default: numdecS <= ~ 7'b1101010;
        endcase
    end
endmodule
