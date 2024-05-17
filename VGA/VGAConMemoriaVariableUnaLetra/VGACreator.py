# Este codigo crea un archvio de texto el cual sera leido por una memoria de video, los valores son 1 o 0 para cada pixel
# los valores son:
HTime = 794
VTime = 523

TimeHa = 95
TimeHb = 48
TimeHc = 635

TimeVa = 2
TimeVb = 32
TimeVc = 479

# Se crea el archivo de texto
Horizontal = 0
with open("VRAMContent.txt", "w") as f:
# Se escriben los valores en el archivo
    for j in range(0, VTime): # Se recorre la pantalla en el eje vertical
        for i in range(0, HTime): # Se recorre la pantalla en el eje horizontal
            if (((TimeHc + TimeHb + TimeHa - 1) > i > (TimeHb + TimeHa + 1)) and 
                ((TimeVc + TimeVb + TimeVa - 1) > j > (TimeVb + TimeVa + 1)) ): # Condiciones para que se pinte un pixel
                # Si se quiere hacer patrones en la pantalla se puede hacer desde aqui

                #Patron 1 lineas verticales que se van separando
                # if UltrimaFila == 0:
                #     f.write("1")
                #     UltrimaFila = i
                # else:
                #     if UltrimaFila + EspacioEntreFilas == i:
                #         f.write("1")
                #         EspacioEntreFilas += 10
                #         UltrimaFila = i
                #     else:
                #         f.write("0")
                #Patron 2 ajedrez
                # if (i+j)%20 == 0:
                #     f.write("1")
                # else:
                #     f.write("0")

                Horizontal = i
                

                # Hasta aqui
            else:
                f.write("0")
        f.write("\n") # Se agrega un salto de linea al final de cada fila
        UltrimaFila = 0
        EspacioEntreFilas = 50

# Se imprime un mensaje de finalizacion
print("Archivo creado con exito")
print("Pixeles pintados: ", Horizontal)

