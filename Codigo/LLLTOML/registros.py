X0 = "00000"
X1 = "00001"
X2 = "00010"
X3 = "00011"
X4 = "00100"
X5 = "00101"
X6 = "00110"
X7 = "00111"
X8 = "01000"
X9 = "01001"
X10 = "01010"
X11 = "01011"
X12 = "01100"
X13 = "01101"
X14 = "01110"
X15 = "01111"
X16 = "10000"
X17 = "10001"
X18 = "10010"
X19 = "10011"
X20 = "10100"
X21 = "10101"
X22 = "10110"
X23 = "10111"
X24 = "11000"
X25 = "11001"
X26 = "11010"
X27 = "11011"
X28 = "11100"
X29 = "11101"
X30 = "11110"
X31 = "11111"


#hacer extencion ya 

def extender(LongitudBinario,longitud,tipo):
    if  LongitudBinario < longitud:
        extencion = ""
        i = 0
        while(i < longitud-LongitudBinario):
            extencion += str(tipo)
            i+=1
        return extencion

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

def DecToBin(numero_decimal,longitud):
    numero_binario = bin(numero_decimal).replace('b',"")
    numero_binario = numero_binario.replace('-',"")
    LongitudBinario = len (numero_binario)
    if numero_decimal >= 0:
        numero_binario= extender(LongitudBinario,longitud,0) + numero_binario
    else:
        numero_binario = complementoa2(LongitudBinario,numero_binario)
        numero_binario = extender(LongitudBinario,longitud,1) + numero_binario
    return numero_binario

print(DecToBin(0,12)[0:7])
print(DecToBin(0,12)[7:])
HOLA= "ANTONIOPEREZPERRO"
print(HOLA[0:7])
print(HOLA[7:])
