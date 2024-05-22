# FPGA- [FPGA](#fpga)
- [FPGA- FPGA](#fpga--fpga)
  - [VGA](#vga)
    - [VGA Simple](#vga-simple)
    - [VGA Con Memoria Fija](#vga-con-memoria-fija)
    - [VGA Con Memoria Variable (Una Letra)](#vga-con-memoria-variable-una-letra)
    - [VGA Con Memoria Variable](#vga-con-memoria-variable)

Varios codios en system verilog, para ser desplegados en un FPGA DE1-Soc

## VGA
### VGA Simple
Esta VGA recibe como entrada 1 reloj de 50 Mhz y SW, el **el pin planer para ella es el sisguiente**:

> TODOS A 3.3LVTTL

Pines basicos para el funcionamiento de la VGA
```
Clk         = PIN_AF14    Reloj de la FPGA
Pixel       = PIN_AB12    Switch 0 de la FPGA
VGA_Clk     = PIN_A11     Reloj del VGA 3.3LV
VGA_sync    = PIN_C10     Sincronizacion del VGA
VGA_blank   = PIN_F10     lIMPIZA DE LA PANTALLA
Hsync       = PIN_B11     Sincronmizacion horizontal
Vsync       = PIN_D11     Sincronmizacion vertical
```
Rojo
```
VGA_PixelR[0] = PIN_A13
VGA_PixelR[1] = PIN_C13
VGA_PixelR[2] = PIN_E13
VGA_PixelR[3] = PIN_B12
VGA_PixelR[4] = PIN_C12
VGA_PixelR[5] = PIN_D12
VGA_PixelR[6] = PIN_E12
VGA_PixelR[7] = PIN_F13
```
Verde
```
VGA_PixelG[0] = PIN_J9
VGA_PixelG[1] = PIN_J10
VGA_PixelG[2] = PIN_H12
VGA_PixelG[3] = PIN_G10
VGA_PixelG[4] = PIN_G11
VGA_PixelG[5] = PIN_G12
VGA_PixelG[6] = PIN_F11
VGA_PixelG[7] = PIN_E11
```
Azul
```
VGA_PixelB[0] = PIN_B13
VGA_PixelB[1] = PIN_G13
VGA_PixelB[2] = PIN_H13
VGA_PixelB[3] = PIN_F14
VGA_PixelB[4] = PIN_H14
VGA_PixelB[5] = PIN_F15
VGA_PixelB[6] = PIN_G15
VGA_PixelB[7] = PIN_J14
```
### VGA Con Memoria Fija
Esta VGA recibe como entrada 1 reloj de 50 Mhz, el **el pin planer para ella es el sisguiente**:

> TODOS A 3.3LVTTL

Pines basicos para el funcionamiento de la VGA
```
Clk         = PIN_AF14    Reloj de la FPGA
VGA_Clk     = PIN_A11     Reloj del VGA 3.3LV
VGA_sync    = PIN_C10     Sincronizacion del VGA
VGA_blank   = PIN_F10     lIMPIZA DE LA PANTALLA
Hsync       = PIN_B11     Sincronmizacion horizontal
Vsync       = PIN_D11     Sincronmizacion vertical
```
Rojo
```
VGA_PixelR[0] = PIN_A13
VGA_PixelR[1] = PIN_C13
VGA_PixelR[2] = PIN_E13
VGA_PixelR[3] = PIN_B12
VGA_PixelR[4] = PIN_C12
VGA_PixelR[5] = PIN_D12
VGA_PixelR[6] = PIN_E12
VGA_PixelR[7] = PIN_F13
```
Verde
```
VGA_PixelG[0] = PIN_J9
VGA_PixelG[1] = PIN_J10
VGA_PixelG[2] = PIN_H12
VGA_PixelG[3] = PIN_G10
VGA_PixelG[4] = PIN_G11
VGA_PixelG[5] = PIN_G12
VGA_PixelG[6] = PIN_F11
VGA_PixelG[7] = PIN_E11
```
Azul
```
VGA_PixelB[0] = PIN_B13
VGA_PixelB[1] = PIN_G13
VGA_PixelB[2] = PIN_H13
VGA_PixelB[3] = PIN_F14
VGA_PixelB[4] = PIN_H14
VGA_PixelB[5] = PIN_F15
VGA_PixelB[6] = PIN_G15
VGA_PixelB[7] = PIN_J14
```
### VGA Con Memoria Variable (Una Letra)
Esta VGA recibe como entrada 1 reloj de 50 Mhz, el **el pin planer para ella es el sisguiente**:

> TODOS A 3.3LVTTL

Pines basicos para el funcionamiento de la VGA
```
Clk         = PIN_AF14    Reloj de la FPGA
Pulsador    = PIN_AA14    Pulsador de la FPGA para cambiar de letra
VGA_Clk     = PIN_A11     Reloj del VGA 3.3LV
VGA_sync    = PIN_C10     Sincronizacion del VGA
VGA_blank   = PIN_F10     lIMPIZA DE LA PANTALLA
Hsync       = PIN_B11     Sincronmizacion horizontal
Vsync       = PIN_D11     Sincronmizacion vertical
```
Rojo
```
VGA_PixelR[0] = PIN_A13
VGA_PixelR[1] = PIN_C13
VGA_PixelR[2] = PIN_E13
VGA_PixelR[3] = PIN_B12
VGA_PixelR[4] = PIN_C12
VGA_PixelR[5] = PIN_D12
VGA_PixelR[6] = PIN_E12
VGA_PixelR[7] = PIN_F13
```
Verde
```
VGA_PixelG[0] = PIN_J9
VGA_PixelG[1] = PIN_J10
VGA_PixelG[2] = PIN_H12
VGA_PixelG[3] = PIN_G10
VGA_PixelG[4] = PIN_G11
VGA_PixelG[5] = PIN_G12
VGA_PixelG[6] = PIN_F11
VGA_PixelG[7] = PIN_E11
```
Azul
```
VGA_PixelB[0] = PIN_B13
VGA_PixelB[1] = PIN_G13
VGA_PixelB[2] = PIN_H13
VGA_PixelB[3] = PIN_F14
VGA_PixelB[4] = PIN_H14
VGA_PixelB[5] = PIN_F15
VGA_PixelB[6] = PIN_G15
VGA_PixelB[7] = PIN_J14
```
### VGA Con Memoria Variable
Esta VGA recibe como entrada 1 reloj de 50 Mhz, y dos pulsadores el **el pin planer para ella es el sisguiente**:

> TODOS A 3.3LVTTL

Pines basicos para el funcionamiento de la VGA
```
Clk         = PIN_AF14    Reloj de la FPGA
Letra4      = PIN_AA14    Letra 4
Letra3      = PIN_AA15    Letra 3
Letra2      = PIN_W15     Letra 2
Letra1      = PIN_Y16     Letra 1
VGA_Clk     = PIN_A11     Reloj del VGA 3.3LV
VGA_sync    = PIN_C10     Sincronizacion del VGA
VGA_blank   = PIN_F10     lIMPIZA DE LA PANTALLA
Hsync       = PIN_B11     Sincronmizacion horizontal
Vsync       = PIN_D11     Sincronmizacion vertical
```
Rojo
```
VGA_PixelR[0] = PIN_A13
VGA_PixelR[1] = PIN_C13
VGA_PixelR[2] = PIN_E13
VGA_PixelR[3] = PIN_B12
VGA_PixelR[4] = PIN_C12
VGA_PixelR[5] = PIN_D12
VGA_PixelR[6] = PIN_E12
VGA_PixelR[7] = PIN_F13
```
Verde
```
VGA_PixelG[0] = PIN_J9
VGA_PixelG[1] = PIN_J10
VGA_PixelG[2] = PIN_H12
VGA_PixelG[3] = PIN_G10
VGA_PixelG[4] = PIN_G11
VGA_PixelG[5] = PIN_G12
VGA_PixelG[6] = PIN_F11
VGA_PixelG[7] = PIN_E11
```
Azul
```
VGA_PixelB[0] = PIN_B13
VGA_PixelB[1] = PIN_G13
VGA_PixelB[2] = PIN_H13
VGA_PixelB[3] = PIN_F14
VGA_PixelB[4] = PIN_H14
VGA_PixelB[5] = PIN_F15
VGA_PixelB[6] = PIN_G15
VGA_PixelB[7] = PIN_J14
```
