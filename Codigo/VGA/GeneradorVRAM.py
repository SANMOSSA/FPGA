import random
ML = open("Memoria.txt", "w")
for fila in range (0,10):
    for Columna in range (0,10):
        ML.write(f"mem[{fila}][{Columna}] <= letra[{fila}][{Columna}];")   
        ML.write("\n")
ML.close()