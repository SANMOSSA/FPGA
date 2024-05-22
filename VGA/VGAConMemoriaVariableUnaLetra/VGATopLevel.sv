module VGATopLevel(
    input logic Clk,            // Señal de reloj del sistema.
    input logic Pulsador,      // Selector de archivo 
    output logic [7:0] VGA_PixelR,  // Color Rojo del pixel a mostrar.
    output logic [7:0] VGA_PixelG,  // Color Verde del pixel a mostrar.
    output logic [7:0] VGA_PixelB,  // Color Azul del pixel a mostrar.
    output logic VGA_Clk,       // Señal de reloj para el VGA.
    output logic VGA_sync,      // Señal de sincronización para el VGA.
    output logic VGA_blank,     // Señal para borrar la pantalla del VGA.
    output logic Hsync,         // Señal de sincronización horizontal para el VGA.
    output logic Vsync          // Señal de sincronización vertical para el VGA.

);
    logic [10:0] TimeCountH = 0;   // Contador para el tiempo horizontal.
    logic [10:0] TimeCountV = 0;   // Contador para el tiempo vertical.
	 logic Pixel = 1;
	 parameter HTime = 794;  // Parámetros para el tiempo horizontal.
    parameter VTime = 523;   // Parámetros para el tiempo vertical.

	 logic VRAM_Clk;
    initial VRAM_Clk = 0;    // Inicializa la señal de reloj para el VGA en 0.

    always @(posedge Clk) begin   // Siempre que hay un flanco de subida en la señal de reloj del sistema.
        VRAM_Clk = ~VRAM_Clk;        // Invierte el valor de la señal de reloj para el VGA.
    end
    always @(posedge VRAM_Clk) begin   // Siempre que hay un flanco de subida en la señal de reloj para el VGA.
        if (TimeCountV > (VTime - 1)) begin   // Si el contador de tiempo vertical es mayor que VTime - 1.
            TimeCountV = 0;                   // Reinicia el contador.
        end
        if (TimeCountH > (HTime - 1)) begin   // Si el contador de tiempo horizontal es igual a HTime - 1.
            TimeCountH = 0;                   // Reinicia el contador de tiempo horizontal.
            TimeCountV = TimeCountV + 1;       // Incrementa el contador de tiempo vertical.
        end
        else begin
            TimeCountH = TimeCountH + 1;       // Si no, incrementa el contador de tiempo horizontal.
        end
    end
    VRAMReader instanciaVRAM(.Fila(TimeCountV), .Columna(TimeCountH), .Pixel(Pixel), .Pulsador(Pulsador));   // Instancia el módulo VRAM.
    VGADrawer instanciaVGADrawer(.Clk(Clk), .Pixel(Pixel), .VGA_PixelR(VGA_PixelR), .VGA_PixelG(VGA_PixelG), .VGA_PixelB(VGA_PixelB), .VGA_Clk(VGA_Clk), .VGA_sync(VGA_sync), .VGA_blank(VGA_blank), .Hsync(Hsync), .Vsync(Vsync));   // Instancia el módulo VGADrawer.

endmodule
