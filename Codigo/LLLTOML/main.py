#┌─────────────────────────────┐ 
#│         Design by           │     
#│    Xcerock = Frederick      │ 
#│    Samossa = Santiago       │ 
#└─────────────────────────────┘ 

#Declaracion de OPcode como constante para su uso en distintas funciones
import os
OPCODETR = "0110011"
OPCODETI = "0010011"
OPCODETB = "1100011"
OPCODETS = "0100011"
OPCODETL = "0000011"
OPCODETJLR = "1100111"
OPCODETJL = "1101111"
OPCODETAUIP = "0010111"
OPCODETLUI = "0110111"

def divisor (Nombre):
    codigobin = open("ML"+Nombre+".txt")
    codigoDividido = open("ML"+Nombre+"Dividido.txt","w")
    Instrucciones = codigobin.readlines()
    codigobin.close()
    for linea in Instrucciones:
        codigoDividido.write(linea[0:8] + "\n")
        codigoDividido.write(linea[8:16] + "\n")
        codigoDividido.write(linea[16:24] + "\n")
        codigoDividido.write(linea[24:32] + "\n")
    codigoDividido.close()


#decodificador de etiquetas para identificar saltos
#
#
#
def etiqueta(Instrucciones,i):
    Etiqueta = Instrucciones[i][-2]
    longitud = len(Instrucciones)
    for j in range(0,i+1):
        if Instrucciones[i-j][-1] == Etiqueta:
            return (-j)*4
            #por si es negativo
    for j in range(i,longitud):
        if Instrucciones[j][-1] == Etiqueta:
            return (j-i)*4
            #por si es positivo
    return -256

#extencion de binarios en base a la diferencia de longitud existente
#
def extender(LongitudBinario,longitud,tipo):
    extencion = ""
    if  LongitudBinario < longitud:
        i = 0
        while(i < longitud-LongitudBinario):
            extencion += str(tipo)
            i+=1
    return extencion

#complemento a 2 para hacer la forma binaria de un numero negativo
def complementoa2(LongitudBinario,numero_binario):
    listaBinario = list(numero_binario)
    for i in range(0,LongitudBinario):
        
        if listaBinario[i] == '0':
            listaBinario[i]="1" 
        else:
            listaBinario[i] = "0"
    for i in range(1,LongitudBinario+1):
        if listaBinario[LongitudBinario-i] == '0':
            listaBinario[LongitudBinario-i] = '1'
            break
        else:
            listaBinario[LongitudBinario-i]='0'
    numero_binario = "".join(listaBinario)
    return numero_binario

#en este se hace la conversion de decimal a binario para su posterior uso en otras funciones
def DecToBin(numero_decimal,longitud):
    numero_binario = bin(numero_decimal).replace('b',"")
    numero_binario = numero_binario.replace('-',"")
    numero_binario = numero_binario.removeprefix("0")
    LongitudBinario = len (numero_binario)
    if numero_decimal >= 0:
        numero_binario= extender(LongitudBinario,longitud,0) + numero_binario
    else:
        numero_binario = complementoa2(LongitudBinario,numero_binario)
        numero_binario = extender(LongitudBinario,longitud,1) + numero_binario
    return numero_binario

#limpieza de las instrucciones y transformacion en listas y sublistas de intrucciones para poder 
def Clear(Archivo):
    codigo = open(Archivo,"r")
    Instrucciones = codigo.readlines()
    codigo.close()
    for i in range(0,len(Instrucciones)):
        Instrucciones[i] = Instrucciones[i].lower()
        Instrucciones[i] = Instrucciones[i].replace(",","")
        Instrucciones[i] = Instrucciones[i].replace("\n","")
        Instrucciones[i] = Instrucciones[i].replace("(","")
        Instrucciones[i] = Instrucciones[i].replace(")","")
        if "xor" in Instrucciones[i]:
            Instrucciones[i] = Instrucciones[i].replace("x","")
            Instrucciones[i] = Instrucciones[i].replace("or","xor")
        elif "xori" in Instrucciones[i]:
            Instrucciones[i] = Instrucciones[i].replace("x","")
            Instrucciones[i] = Instrucciones[i].replace("ori","xori")
        else:
            Instrucciones[i] = Instrucciones[i].replace("x","")
        Instrucciones[i] = Instrucciones[i].split(" ")
    return Instrucciones

#Decodificador 
#Nota: Cuando lo hicimos solo Dios, Santiago y Frederick sabian que hacian
#      Ahora solo Dios lo sabe
def RISCV32BITS(Instrucciones,tipoins):
    ML = open("ML"+tipoins+".txt", "w")
    #crea el archivo
    for i in range(0,len(Instrucciones)):
        #Instrucciones tipo R
        if Instrucciones[i][0] == "add":
            ml =("0000000"+str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "000"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETR)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "sub":   
            ml =("0100000"+str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "000"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETR)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "slt":
            ml =("0000000"+str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "001"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETR)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "sltu":
            ml =("0000000"+str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "011"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETR)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "xor":
            ml =("0000000"+str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "100"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETR)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "srl":
            ml =("0000000"+str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "101"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETR)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "sra":
            ml =("0100000"+str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "101"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETR)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "or":
            ml =("0000000"+str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "110"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETR)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "and":
            ml =("0000000"+str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "111"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETR)
            ML.write(ml + "\n")
        #Instrucciones tipo I
        elif Instrucciones[i][0] == "addi":
            ml =( str(DecToBin(int(Instrucciones[i][3]),12))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "000"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETI)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "slli":
            ml =( str(DecToBin(int(Instrucciones[i][3]),12))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "001"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETI)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "slti":
            ml =( str(DecToBin(int(Instrucciones[i][3]),12))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "010"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETI)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "sltui":
            ml =( str(DecToBin(int(Instrucciones[i][3]),12))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "011"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETI)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "xori":
            ml =( str(DecToBin(int(Instrucciones[i][3]),12))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "100"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETI)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "srli":
            ml =("0000000" + str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "101"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETI)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "srai":
            ml =("0000001" + str(DecToBin(int(Instrucciones[i][3]),5))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "101"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETI)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "ori":
            ml =( str(DecToBin(int(Instrucciones[i][3]),12))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "110"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETI)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "andi":
            ml =( str(DecToBin(int(Instrucciones[i][3]),12))
                + str(DecToBin(int(Instrucciones[i][2]),5))+ "111"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETI)
            ML.write(ml + "\n")
        #Instrucciones tipo L
        elif Instrucciones[i][0] == "lb":
            ml =(str(DecToBin(int(Instrucciones[i][2]),12))
                + str(DecToBin(int(Instrucciones[i][3]),5))+ "000"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETL)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "lh":
            ml =(str(DecToBin(int(Instrucciones[i][2]),12))
                + str(DecToBin(int(Instrucciones[i][3]),5))+ "001"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETL)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "lw":
            ml =(str(DecToBin(int(Instrucciones[i][2]),12))
                + str(DecToBin(int(Instrucciones[i][3]),5))+ "010"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETL)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "lbu":
            ml =(str(DecToBin(int(Instrucciones[i][2]),12))
                + str(DecToBin(int(Instrucciones[i][3]),5))+ "100"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETL)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "lhu":
            ml =(str(DecToBin(int(Instrucciones[i][2]),12))
                + str(DecToBin(int(Instrucciones[i][3]),5))+ "101"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETL)
            ML.write(ml + "\n")
        #Instrucciones tipo JALR
        elif Instrucciones[i][0] == "jalr":
            ml =(str(DecToBin(int(Instrucciones[i][2]),12))
                + str(DecToBin(int(Instrucciones[i][3]),5))+ "000"
                + str(DecToBin(int(Instrucciones[i][1]),5))+ OPCODETJLR)
            ML.write(ml + "\n")
        #Instrucciones tipo B
        elif Instrucciones[i][0] == "beq":
            Imm = etiqueta(Instrucciones,i)
            print(str(Imm)+" "+str(i))
            Imm = str(DecToBin(Imm,13))
            ml =(Imm[0]+Imm[2:8]+ str(DecToBin(int(Instrucciones[i][2]),5))
                + str(DecToBin(int(Instrucciones[i][1]),5))
                + "000" + Imm[8:12]+ Imm[1]+ OPCODETB)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "bne":
            Imm = etiqueta(Instrucciones,i)
            Imm = str(DecToBin(Imm,13))
            ml =(Imm[0]+Imm[2:8]+ str(DecToBin(int(Instrucciones[i][2]),5))
                + str(DecToBin(int(Instrucciones[i][1]),5))
                + "001" + Imm[8:12]+ Imm[1]+ OPCODETB)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == 'blt':
            Imm = etiqueta(Instrucciones,i)
            Imm = str(DecToBin(Imm,13))
            ml = (Imm[0]+Imm[2:8]+ str(DecToBin(int(Instrucciones[i][2]),5))
                + str(DecToBin(int(Instrucciones[i][1]),5))
                + "100" + Imm[8:12]+ Imm[1]+ OPCODETB)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "bge":
            Imm = etiqueta(Instrucciones,i)
            
            Imm = str(DecToBin(Imm,13))
            ml =(Imm[0]+Imm[2:8]+ str(DecToBin(int(Instrucciones[i][2]),5))
                + str(DecToBin(int(Instrucciones[i][1]),5))
                + "101" + Imm[8:12]+ Imm[1]+ OPCODETB)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "bltu":
            Imm = etiqueta(Instrucciones,i)
            Imm = str(DecToBin(Imm,13))
            ml =(Imm[0]+Imm[2:8]+ str(DecToBin(int(Instrucciones[i][2]),5))
                + str(DecToBin(int(Instrucciones[i][1]),5))
                + "110" + Imm[8:12]+ Imm[1]+ OPCODETB)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "bgeu":
            Imm = etiqueta(Instrucciones,i)
            Imm = str(DecToBin(Imm,13))
            ml =(Imm[0]+Imm[2:8]+ str(DecToBin(int(Instrucciones[i][2]),5))
                + str(DecToBin(int(Instrucciones[i][1]),5))
                + "111" + Imm[8:12]+ Imm[1]+ OPCODETB)
            ML.write(ml + "\n")
        #Instrucciones tipo S
        elif Instrucciones[i][0] == "sb":
            Imm = str(DecToBin(int(Instrucciones[i][2]),12))
            ml =(Imm[0:7] + str(DecToBin(int(Instrucciones[i][1]),5))
                + str(DecToBin(int(Instrucciones[i][3]),5))
                + "000" + Imm[7:]+ OPCODETS)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "sh":
            Imm = str(DecToBin(int(Instrucciones[i][2]),12))
            ml =(Imm[0:7] + str(DecToBin(int(Instrucciones[i][1]),5))
                + str(DecToBin(int(Instrucciones[i][3]),5))
                + "001" + Imm[7:]+ OPCODETS)
            ML.write(ml + "\n")
        elif Instrucciones[i][0] == "sw":
            Imm = str(DecToBin(int(Instrucciones[i][2]),12))
            ml =(Imm[0:7] + str(DecToBin(int(Instrucciones[i][1]),5))
                + str(DecToBin(int(Instrucciones[i][3]),5))
                + "010" + Imm[7:] + OPCODETS)
            ML.write(ml + "\n")
        #Instrucciones tipo JAL
        elif Instrucciones[i][0] == "jal":
            Imm = etiqueta(Instrucciones,i)
            Imm = str(DecToBin(Imm,21))
            ml =(Imm[0]+Imm[10:20]+Imm[9]+Imm[1:9]+ 
                str(DecToBin(int(Instrucciones[i][1]),5))
                + OPCODETJL)
            ML.write(ml + "\n")
        #Instrucciones tipo Esto es un secreto de la nasa no sabemos ni quien lo usa
        elif Instrucciones[i][0] == "lui":
            pass
        elif Instrucciones[i][0] == "auipc":
            pass
    ML.close() 
    #end of evangelion   
os.system("cls")
print("Nombre de la funcion que desea convertir")
tipoins = input().lower()        
Instrucciones = Clear("LLL"+tipoins+".txt")
RISCV32BITS(Instrucciones,tipoins)
divisor(tipoins)