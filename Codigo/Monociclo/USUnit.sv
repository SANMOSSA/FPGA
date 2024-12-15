module USUnit (clk,UserSrc,Push,clkmod);
  input logic  clk;
  input logic  UserSrc;
  input logic  Push;

  output logic  clkmod = 1;

  always_comb
    begin 
     if (negedge Push)
     begin
      clkmod = 1;
     end
     else
     begin
      if (clk and UserSrc)
        clkmod <= clk;
      else
        clkmod <= 0;
     end
    end
endmodule
