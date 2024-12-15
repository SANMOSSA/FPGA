from datos_conexion import *

def agregar_paciente(seg_social, dni, mombre, apellido, fecha_nacimiento, conexion):
    conexion.cursor.execute("select database();")
    record = conexion.cursor.fetchone()
    print("You're connected to database: ", record)

#agregar_pacientes()