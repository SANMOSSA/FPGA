col1 = []
col2 = []
col3 = []
col4 = []
col5 = []
col6 = []
def divisor2(col1, letras):
    cadena =""
    for string in col1:
        if len(cadena) == 100:
            letras.append(cadena)
            cadena =""
        else:
            cadena+=string

def divisor ():
    ascii = open("ascii.txt","r")
    texto = ascii.read()
    textolinea = texto.split("\n")
    for j in range(0,160):
        for i in range(1,7):
            if i == 1:
                col1.append(textolinea[j][i*10-10:i*10])
            if i == 2:
                col2.append(textolinea[j][i*10-10:i*10])
            if i == 3:
                col3.append(textolinea[j][i*10-10:i*10])
            if i == 4:
                col4.append(textolinea[j][i*10-10:i*10])
            if i == 5:
                col5.append(textolinea[j][i*10-10:i*10])
            if i == 6:
                col6.append(textolinea[j][i*10-10:i*10])
letras = []
divisor()
col = col1+col2+col3+col4+col5+col6
for st in col:
    print(st)

print()
# for st in letras:
#     print(st[0:9])
#     print(st[10:19])
#     print(st[20:29])
#     print(st[30:39])
#     print(st[40:49])
#     print(st[50:59])
#     print(st[60:69])
#     print(st[70:79])
#     print(st[80:89])
#     print(st[90:99])
# divisor2(col2, letras)
# divisor2(col3, letras)
# divisor2(col4, letras)
# divisor2(col5, letras)
# divisor2(col6, letras)

