module VGA(Clk,Push,VGA_Pixel,VGA_Clk,VGA_sync,VGA_blank,Hsync,Vsync);
  input logic Clk;
  input logic Push;
  output logic [23:0] VGA_Pixel;//color
  output logic VGA_Clk; // reloj
  output logic VGA_sync;
  output logic VGA_blank;
  output logic Hsync;//sinc Horizontal
  output logic Vsync;//sinc vertical
  //counters
  logic [10:0] TimeCountH = 0;
  logic [10:0] TimeCountV = 0;
  logic [9:0] letra[9:0];
  parameter HTime = 800;
  parameter VTime = 525;
  
  reg [7:0] dy = 0;
  
  reg [7:0] ascii = 7'b0100000;
  
  reg VGA_Clk1 = 0;
  
  always @(negedge Push)
	begin
		ascii <= ascii + 1;
		//dy <= dy + 1;
	end 
  
  always @(posedge Clk) begin
    VGA_Clk1 = ~VGA_Clk1;
  end
  
  
  always @(posedge VGA_Clk1) 
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

VRAm instVRAM (TimeCountV,TimeCountH,dy,letra,Pixel);
FONT_Rom instFont (ascii, letra);
PuenteVRAM_VGA instPUENTEV_V (Clk,Pixel,VGA_Pixel,VGA_Clk,VGA_sync,VGA_blank,Hsync,Vsync);
endmodule