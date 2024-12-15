module PuenteVRAM_VGA(
  input logic clk,
  input logic  Pixel,
  output logic [23:0] VGA_Pixel,//color
  output logic VGA_Clk, // reloj
  output logic VGA_sync,
  output logic VGA_blank,
  output logic Hsync,//sinc Horizontal
  output logic Vsync//sinc vertical
);
  //counters
  logic [10:0] TimeCountH = 0;
  logic [10:0] TimeCountV = 0;
    
  //timing parameters
  parameter HTime = 800, TimeHa = 96, TimeHb = 48, TimeHc = 640;
  parameter VTime = 525, TimeVa = 2, TimeVb = 33, TimeVc = 480;
  
 //parameter HTime = 12, TimeHa = 1, TimeHb = 2, TimeHc = 7;
 //parameter VTime = 10, TimeVa = 1, TimeVb = 1, TimeVc = 6;
  
  initial
    VGA_Clk = 0;
  
  always @(posedge clk) begin
    VGA_Clk = ~VGA_Clk;
  end

  always @(posedge VGA_Clk) 
  begin
    if(TimeCountV > (VTime - 1))        
      TimeCountV <= 0;

    if(TimeCountH == (HTime - 1))
	begin        
      TimeCountH <= 0;
      TimeCountV <= TimeCountV + 1;
    end
    else 
	 begin  
      TimeCountH <= TimeCountH + 1;
    end
  end

  assign VGA_Pixel = TimeCountH < 800 && TimeCountV < 525 ? {24{Pixel}}:24'b000000001111111100000000;

  assign VGA_blank = 1;
  assign VGA_sync = 1;

  assign Hsync = (TimeCountH < 656) ? 0 : 1;
  assign Vsync = (TimeCountV < 490) ? 0 : 1;

endmodule