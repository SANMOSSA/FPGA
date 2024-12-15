module Decodificador(numero,numdec1,numdec2);
    input logic [7:0]  numero;
    output logic signed [6:0] numdec1;
    output logic signed [6:0] numdec2;

  
  DecodificadorHijo insthijo1 (numero[7:4],numdec1);
  DecodificadorHijo insthijo2 (numero[3:0],numdec2);
endmodule
