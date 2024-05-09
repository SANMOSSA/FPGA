// Este es un módulo en SystemVerilog para controlar la salida de video en un monitor VGA. 
// El módulo recibe una señal de reloj del sistema y un pixel de entrada (Un SW) y genera las señales de salida para el monitor VGA.
// El módulo dibuja un cuadrado en el centro de la pantalla con un borde de diferentes colores para saber la orientacion y que tan centrado esta el cuadrado.

module VGADrawer(
    input logic Clk,            // Señal de reloj del sistema.
    input logic Pixel,          // Pixel a mostrar en el monitor.
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
    parameter HTime = 794, TimeHa = 95, TimeHb = 48, TimeHc = 634;  // Parámetros para el tiempo horizontal.
    parameter VTime = 523, TimeVa = 2, TimeVb = 32, TimeVc = 479;   // Parámetros para el tiempo vertical.

    initial VGA_Clk = 0;    // Inicializa la señal de reloj para el VGA en 0.

    always @(posedge Clk) begin   // Siempre que hay un flanco de subida en la señal de reloj del sistema.
        VGA_Clk = ~VGA_Clk;        // Invierte el valor de la señal de reloj para el VGA.
    end

    always @(posedge VGA_Clk) begin   // Siempre que hay un flanco de subida en la señal de reloj para el VGA.
        if (TimeCountV > (VTime - 1)) begin   // Si el contador de tiempo vertical es mayor que VTime - 1.
            TimeCountV = 0;                   // Reinicia el contador.
        end
        if (TimeCountH == (HTime - 1)) begin   // Si el contador de tiempo horizontal es igual a HTime - 1.
            TimeCountH = 0;                   // Reinicia el contador de tiempo horizontal.
            TimeCountV = TimeCountV + 1;       // Incrementa el contador de tiempo vertical.
        end
        else begin
            TimeCountH = TimeCountH + 1;       // Si no, incrementa el contador de tiempo horizontal.
        end
        // Si el contador de tiempo horizontal está en el rango de sincronización horizontal y vertical.
        if ((TimeCountH > (TimeHb + TimeHa)) && 
			(TimeCountH < (TimeHc + TimeHb + TimeHa)) && 
			(TimeCountV > (TimeVb + TimeVa)) && 
			(TimeCountV < (TimeVc + TimeVb + TimeVa))) begin   
            if (TimeCountH == (TimeHb + TimeHa + 1)) begin
                // Borde izquierdo (rojo)
                VGA_PixelR = 8'b11111111;   // Borde rojo
                VGA_PixelG = 8'b00000000;   // Borde verde
                VGA_PixelB = 8'b00000000;   // Borde azul
            end
            else if (TimeCountV == (TimeVb + TimeVa + 1)) begin
                // Borde superior (verde)
                VGA_PixelR = 8'b00000000;   // Borde rojo
                VGA_PixelG = 8'b11111111;   // Borde verde
                VGA_PixelB = 8'b00000000;   // Borde azul
            end
            else if (TimeCountH == (TimeHc + TimeHb + TimeHa - 1)) begin
                // Borde derecho (azul)
                VGA_PixelR = 8'b00000000;   // Borde rojo
                VGA_PixelG = 8'b00000000;   // Borde verde
                VGA_PixelB = 8'b11111111;   // Borde azul
            end
            else if (TimeCountV == (TimeVc + TimeVb + TimeVa - 1)) begin
                // Borde abajo (amarillo)
                VGA_PixelR = 8'b11111111;   // Borde rojo
                VGA_PixelG = 8'b11111111;   // Borde verde
                VGA_PixelB = 8'b00000000;   // Borde azul
            end
            else begin
                // Dibuja el interior del cuadrado
                VGA_PixelR = {8{Pixel}};   // Asigna el valor del color rojo del pixel.
                VGA_PixelG = {8{Pixel}};   // Asigna el valor del color verde del pixel.
                VGA_PixelB = {8{Pixel}};   // Asigna el valor del color azul del pixel.
            end

        end
        else begin
            VGA_PixelR = 8'b00000000;   // Asigna el color rojo del pixel.
            VGA_PixelG = 8'b00000000;   // Asigna el color verde del pixel.
            VGA_PixelB = 8'b00000000;   // Asigna el color azul del pixel.
        end
       
        VGA_blank = 1;     // Asigna 1 a la señal de borrar pantalla para el VGA.
        VGA_sync = 1;      // Asigna 1 a la señal de sincronización para el VGA.
        Hsync = (TimeCountH < TimeHa) ? 0 : 1;   // Asigna el valor de la señal de sincronización horizontal dependiendo del valor del contador de tiempo horizontal.
        Vsync = (TimeCountV < TimeVa) ? 0 : 1;   // Asigna el valor de la señal de sincronización vertical dependiendo del valor del contador de tiempo vertical.
    end

endmodule   // Termina la definición del módulo.


//Pin planer TODOS A 3.3LV
//Clk = PIN_AF14  Reloj de la FPGA
//Pixel = PIN_AB12  Switch 0 de la FPGA
//VGA_Clk = PIN_A11 Reloj del VGA 3.3LV
//VGA_sync = PIN_C10 Sincronizacion del VGA
//VGA_blank = PIN_F10 lIMPIZA DE LA PANTALLA
//Hsync = PIN_B11 Sincronmizacion horizontal
//Vsync = PIN_D11 Sincronmizacion vertical
//Rojo
//VGA_PixelR[0] = PIN_A13
//VGA_PixelR[1] = PIN_C13
//VGA_PixelR[2] = PIN_E13
//VGA_PixelR[3] = PIN_B12
//VGA_PixelR[4] = PIN_C12
//VGA_PixelR[5] = PIN_D12
//VGA_PixelR[6] = PIN_E12
//VGA_PixelR[7] = PIN_F13
//Verde
//VGA_PixelG[0] = PIN_J9
//VGA_PixelG[1] = PIN_J10
//VGA_PixelG[2] = PIN_H12
//VGA_PixelG[3] = PIN_G10
//VGA_PixelG[4] = PIN_G11
//VGA_PixelG[5] = PIN_G12
//VGA_PixelG[6] = PIN_F11
//VGA_PixelG[7] = PIN_E11
//Azul
//VGA_PixelB[0] = PIN_B13
//VGA_PixelB[1] = PIN_G13
//VGA_PixelB[2] = PIN_H13
//VGA_PixelB[3] = PIN_F14
//VGA_PixelB[4] = PIN_H14
//VGA_PixelB[5] = PIN_F15
//VGA_PixelB[6] = PIN_G15
//VGA_PixelB[7] = PIN_J14



