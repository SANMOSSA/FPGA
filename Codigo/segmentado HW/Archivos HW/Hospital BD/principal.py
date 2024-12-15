import tkinter as tk
import datos_conexion
from tkinter import *
from tkinter import ttk

def popups(resultado, medida):
    popups = tk.Tk()
    popups.geometry(medida)
    mensaje = tk.Label(popups, text=resultado, font=("Arial Bold", 12),).pack()

def agregar_planta(n_camas, nombre, conexion):
    n_camas = n_camas.get() 
    nombre = nombre.get()
    if n_camas == "" or nombre == "":
        popups('Alguno de los campos se encuentra vacio', "300x100")
    else:
        try:
            conexion.cursor.execute("SELECT MAX(n_planta) as max FROM planta")
            resultado = conexion.cursor.fetchone()
            try: 
                resultado = int(resultado[0])
            except:
                resultado = 0
            resultado = resultado + 1
            sql = "INSERT INTO planta (n_camas, n_planta, nombre)  VALUES (%s, %s, %s)"
            val = (n_camas, resultado , nombre)
            conexion.cursor.execute(sql, val)
            conexion.connection.commit()
            popups("Agregado exitosamente", "300x100")
        except Exception as error:
            print(error)
            popups("error", "300x100")

def agregar_paciente(seg_social, dni, nombre, apellido1, apellido2, fecha_nacimiento, conexion):
    seg_social = seg_social.get() 
    dni = dni.get()
    nombre = nombre.get()
    apellido1 = apellido1.get()
    apellido2 = apellido2.get()
    fecha_nacimiento = fecha_nacimiento.get()
    if seg_social == "" or dni == "" or nombre == "" or apellido1 == "" or fecha_nacimiento == "":
        popups('Alguno de los campos se encuentra vacio', "300x100")
    else:
        try:
            sql = "INSERT INTO paciente VALUES (%s, %s, %s, %s, %s, %s)"
            val = (seg_social, nombre, apellido1, apellido2, dni, fecha_nacimiento)
            conexion.cursor.execute(sql, val)
            conexion.connection.commit()
            popups("Agregado exitosamente", "300x100")
        except Exception as error:
            print(error)
            popups("El dni ingresado ya existe", "300x100")

def refrescar(tabla_paciente):
    tabla_paciente.delete(*tabla_paciente.get_children())
    lista_pacientes = obtener_pacientes(datos_conexion.Conexion())
    for paciente in lista_pacientes:
        tabla_paciente.insert('',0,text=paciente[0],values=paciente[1:])

def refrescar_planta(tabla_planta):
    tabla_planta.delete(*tabla_planta.get_children())
    lista_planta= obtener_planta(datos_conexion.Conexion())
    for planta in lista_planta:
        tabla_planta.insert('',0,text=planta[0],values=planta[1:])
        
def consultar_paciente(dni, conexion):
    try:
        sql = "SELECT * FROM paciente WHERE DNI = %s"
        val = (dni,)
        conexion.cursor.execute(sql, val)
        resultado = conexion.cursor.fetchone()
        return resultado
    except Exception as error:
        error = str(error)
        return error[0:4]    

def consultar_planta(n_planta, conexion):
    try:
        sql = "SELECT * FROM planta WHERE n_planta = %s"
        val = (n_planta,)
        conexion.cursor.execute(sql, val)
        resultado = conexion.cursor.fetchone()
        return resultado
    except Exception as error:
        error = str(error)
        return error[0:4]   
    
#paciente: Lista con todos los datos del paciente       
def modificar_paciente(seg_social, dni, nombre, apellido1, apellido2, fecha_nacimiento, conexion):
    seg_social = seg_social.get() 
    apellido1 = apellido1.get()
    apellido2 = apellido2.get()
    fecha_nacimiento = fecha_nacimiento.get()
    nombre = nombre.get()
    if seg_social == "" or nombre == "" or apellido1 == "" or fecha_nacimiento == "":
        popups('Alguno de los campos se encuentra vacio', "300x100")
    else:
        try:
            sql = "UPDATE paciente SET Seguridad = %s, apellido1 = %s, apellido2 = %s, nombre = %s, fecha_nacimiento = %s WHERE DNI = %s"
            val = (seg_social, apellido1, apellido2, nombre, fecha_nacimiento,dni )
            conexion.cursor.execute(sql, val)
            conexion.connection.commit()
            popups('Datos del paciente actualizados', "300x100")
        except Exception as error:
            print(error)
    
def modificar_planta(n_camas, nombre, n_planta , conexion):
    n_camas = n_camas.get() 
    nombre = nombre.get()
    if n_camas == "" or nombre == "":
        popups('Alguno de los campos se encuentra vacio', "300x100")
    else:
        try:
            sql = "SELECT MAX(n_cama) as max FROM camas WHERE n_planta = %s"
            var = (n_planta, )
            conexion.cursor.execute(sql, var)
            resultado = conexion.cursor.fetchone()
            try:
                if n_camas < resultado[0]:
                    popups('No puede eliminar camas ocupadas', "300x100")
                else:
                    sql = "UPDATE planta SET n_camas = %s, nombre = %s WHERE n_planta = %s"
                    val = (n_camas, nombre, n_planta)
                    conexion.cursor.execute(sql, val)
                    conexion.connection.commit()
                    popups('Datos de la planta actualizados', "300x100")
            except:
                sql = "UPDATE planta SET n_camas = %s, nombre = %s WHERE n_planta = %s"
                val = (n_camas, nombre, n_planta)
                conexion.cursor.execute(sql, val)
                conexion.connection.commit()
                popups('Datos de la planta actualizados', "300x100")
        except Exception as error:
            print(error)

def eliminar_paciente(dni, conexion):
    dni = dni.get()
    if dni == "":
        popups('El campo dni se encuentra vacio', "300x100")
    else:
        try:
            sql = "SELECT * FROM paciente WHERE DNI = %s"
            val = (dni,)
            conexion.cursor.execute(sql, val)
            resultado = conexion.cursor.fetchone()
            if len(resultado) < 1:
                popups('Dni no encontrado', "300x100")
            else:
                sql = "DELETE FROM paciente WHERE DNI = %s"
                val = (dni, )
                conexion.cursor.execute(sql, val)
                conexion.connection.commit()
                popups('Paciente eliminado correctamente', "300x100")
        except:
            popups('Dni no encontrado', "300x100")
        
def obtener_pacientes(conexion):
    try:
        conexion.cursor.execute("SELECT * FROM paciente")
        resultado = conexion.cursor.fetchall()
        return resultado
    except Exception as error:
        error = str(error)
        return error[0:4]

def obtener_planta(conexion):
    try:
        conexion.cursor.execute("SELECT * FROM planta")
        resultado = conexion.cursor.fetchall()
        return resultado
    except Exception as error:
        error = str(error)
        return error[0:4]
        
def ventana_planta():
    win_planta = tk.Tk()
    win_planta.geometry("610x300") 
    lista_planta = obtener_planta(datos_conexion.Conexion())
    tabla_planta = ttk.Treeview(win_planta, columns = ("#0","#1"))
    tabla_planta.grid(row = 1, column = 0, columnspan = 1)
    tabla_planta.heading("#0", text = "# de camas")
    tabla_planta.heading("#2", text = "Nombre planta")
    tabla_planta.heading("#1", text = "# de planta")
    for planta in lista_planta:
        tabla_planta.insert('',0,text=planta[0],values=planta[1:])
    btn_agregar_paciente = tk.Button(win_planta, text="Agregar planta", command = ventana_agregar_planta)
    btn_agregar_paciente.place(anchor = 'center', relx = .15, rely = .85)
    btn_modificar_paciente = tk.Button(win_planta, text="Modificar planta", command = ventana_modificar_planta)
    btn_modificar_paciente.place(anchor = 'center', relx = .5, rely = .85)
    btn_refresh = tk.Button(win_planta, text = "Refrescar", command = lambda:refrescar_planta(tabla_planta))
    btn_refresh.place(anchor = 'center', relx = .8, rely = .85)

def ventana_agregar_planta():
    win_agregar_planta = tk.Tk()
    win_agregar_planta.geometry("400x500")

    m_nombre = tk.Label(win_agregar_planta, text="Nombre", font=("Arial Bold",8))
    m_nombre.place(anchor = 'center', relx = .2, rely = .1)

    m_n_camas = tk.Label(win_agregar_planta, text="# de camas", font=("Arial Bold",8))
    m_n_camas.place(anchor = 'center', relx = .2, rely = .2)

    t_n_camas = tk.Entry(win_agregar_planta)
    t_n_camas.place(anchor = 'center', relx = .5, rely = .2)

    t_nombre = tk.Entry(win_agregar_planta)
    t_nombre.place(anchor = 'center', relx = .5, rely = .1)

    btn_enviar = tk.Button(win_agregar_planta, text="Agregar",command = lambda:agregar_planta(t_n_camas,t_nombre, datos_conexion.Conexion()) )    
    btn_cerrar = tk.Button(win_agregar_planta, text="Cerrar", command=win_agregar_planta.destroy)
    btn_cerrar.place(anchor = 'center', relx = .60, rely = .7)
    btn_enviar.place(anchor = 'center', relx = .30, rely = .7)    
    win_agregar_planta.mainloop()
    

def ventana_modificar_planta():
    win_modificar_planta = tk.Tk()
    win_modificar_planta.geometry("400x200")
    m_npiso = tk.Label(win_modificar_planta, text="ingrese el numero de piso", font=("Arial Bold",12))
    m_npiso.place(anchor = 'center', relx = .5, rely = .3)
    t_npiso = tk.Entry(win_modificar_planta)
    t_npiso.place(anchor = 'center', relx = .5, rely = .5)
    btn_buscar = tk.Button(win_modificar_planta, text="BUSCAR", command = lambda:ventana_modificando_planta(t_npiso, datos_conexion.Conexion()))
    btn_buscar.place(anchor = 'center', relx = .5, rely = .7)

def ventana_modificando_planta(npiso, conexion):   
    npiso = npiso.get()
    consulta = consultar_planta(npiso, conexion)
    win_modificando_planta = tk.Tk()
    win_modificando_planta.geometry("400x500")
    texto = "# de planta: " + str(consulta[1])
    m_npiso = tk.Label(win_modificando_planta, text=texto, font=("Arial Bold",12))
    m_npiso.place(anchor = 'center', relx = .5, rely = .1)

    m_cama = tk.Label(win_modificando_planta, text="Camas", font=("Arial Bold",8))
    m_cama.place(anchor = 'center', relx = .2, rely = .2)

    m_nombre = tk.Label(win_modificando_planta, text="Nombre", font=("Arial Bold",8))
    m_nombre.place(anchor = 'center', relx = .2, rely = .3)

    t_cama = tk.Entry(win_modificando_planta)
    t_cama.place(anchor = 'center', relx = .5, rely = .2)
    t_cama.insert(0, consulta[0])

    t_nombre = tk.Entry(win_modificando_planta)
    t_nombre.place(anchor = 'center', relx = .5, rely = .3)
    t_nombre.insert(0, consulta[2])

    btn_enviar = tk.Button(win_modificando_planta, text="Modificar",command = lambda:modificar_planta(t_cama,t_nombre, consulta[1], datos_conexion.Conexion()))     
    btn_cerrar = tk.Button(win_modificando_planta, text="Cerrar", command=win_modificando_planta.destroy)
    btn_cerrar.place(anchor = 'center', relx = .60, rely = .7)
    btn_enviar.place(anchor = 'center', relx = .30, rely = .7) 


def ventana_paciente():
    win_paciente = tk.Tk()
    win_paciente.geometry("1210x400") 
    lista_pacientes = obtener_pacientes(datos_conexion.Conexion())
    tabla_paciente = ttk.Treeview(win_paciente, columns = ("#0","#1","#2","#3","#4"))
    tabla_paciente.grid(row = 0, column = 0, columnspan = 1)
    tabla_paciente.heading("#0", text = "# seguridad")
    tabla_paciente.heading("#1", text = "Nombre")
    tabla_paciente.heading("#2", text = "Apellido1")
    tabla_paciente.heading("#3", text = "Apellido2")
    tabla_paciente.heading("#4", text = "DNI")
    tabla_paciente.heading("#5", text = "fecha de nacimiento")
    for paciente in lista_pacientes:
        tabla_paciente.insert('',0,text=paciente[0],values=paciente[1:])
    btn_agregar_paciente = tk.Button(win_paciente, text="Agregar pacientes", command = ventana_agregar_paciente)
    btn_agregar_paciente.place(anchor = 'center', relx = .1, rely = .65)
    btn_modificar_paciente = tk.Button(win_paciente, text="Modificar pacientes", command = ventana_modificar_paciente)
    btn_modificar_paciente.place(anchor = 'center', relx = .3, rely = .65)
    btn_eliminar_paciente = tk.Button(win_paciente, text="Eliminar pacientes", command = ventana_eliminar_paciente)
    btn_eliminar_paciente.place(anchor = 'center', relx = .5, rely = .65)
    btn_refresh = tk.Button(win_paciente, text = "Refrescar", command = lambda:refrescar(tabla_paciente))
    btn_refresh.place(anchor = 'center', relx = .7, rely = .65)


def ventana_agregar_paciente():
    win_agregar_paciente = tk.Tk()
    win_agregar_paciente.geometry("400x500")

    m_seguridad = tk.Label(win_agregar_paciente, text="seguridad", font=("Arial Bold",8))
    m_seguridad.place(anchor = 'center', relx = .2, rely = .1)

    m_nombre = tk.Label(win_agregar_paciente, text="Nombre", font=("Arial Bold",8))
    m_nombre.place(anchor = 'center', relx = .2, rely = .2)

    m_Apellido1 = tk.Label(win_agregar_paciente, text="Apellido1", font=("Arial Bold",8))
    m_Apellido1.place(anchor = 'center', relx = .2, rely = .3)

    m_Apellido2 = tk.Label(win_agregar_paciente, text="Apellido2", font=("Arial Bold",8))
    m_Apellido2.place(anchor = 'center', relx = .2, rely = .4)

    m_dni = tk.Label(win_agregar_paciente, text="DNI", font=("Arial Bold",8))
    m_dni.place(anchor = 'center', relx = .2, rely = .5)

    m_fecha = tk.Label(win_agregar_paciente, text="fecha de nacimiento", font=("Arial Bold",8))
    m_fecha.place(anchor = 'center', relx = .2, rely = .6)


    t_seguridad = tk.Entry(win_agregar_paciente)
    t_seguridad.place(anchor = 'center', relx = .5, rely = .1)

    t_nombre = tk.Entry(win_agregar_paciente)
    t_nombre.place(anchor = 'center', relx = .5, rely = .2)

    t_Apellido1 = tk.Entry(win_agregar_paciente,)
    t_Apellido1.place(anchor = 'center', relx = .5, rely = .3)

    t_Apellido2 = tk.Entry(win_agregar_paciente)
    t_Apellido2.place(anchor = 'center', relx = .5, rely = .4)

    t_dni = tk.Entry(win_agregar_paciente)
    t_dni.place(anchor = 'center', relx = .5, rely = .5)
    
    t_fecha = tk.Entry(win_agregar_paciente,)
    t_fecha.place(anchor = 'center', relx = .5, rely = .6)
    t_fecha.insert(0, "AAAA - mm - dd")


    btn_enviar = tk.Button(win_agregar_paciente, text="Agregar",command = lambda:agregar_paciente(t_seguridad, t_dni, t_nombre, t_Apellido1, t_Apellido2, t_fecha, datos_conexion.Conexion()))     
    btn_cerrar = tk.Button(win_agregar_paciente, text="Cerrar", command=win_agregar_paciente.destroy)
    btn_cerrar.place(anchor = 'center', relx = .60, rely = .7)
    btn_enviar.place(anchor = 'center', relx = .30, rely = .7)    
    win_agregar_paciente.mainloop()
 #  
def ventana_modificar_paciente():
    win_modificar_paciente = tk.Tk()
    win_modificar_paciente.geometry("400x200")
    m_dni = tk.Label(win_modificar_paciente, text="ingrese el DNI del paciente", font=("Arial Bold",12))
    m_dni.place(anchor = 'center', relx = .5, rely = .3)
    t_dni = tk.Entry(win_modificar_paciente)
    t_dni.place(anchor = 'center', relx = .5, rely = .5)
    btn_buscar = tk.Button(win_modificar_paciente, text="BUSCAR", command = lambda:ventana_modificando_paciente(t_dni, datos_conexion.Conexion()))
    btn_buscar.place(anchor = 'center', relx = .5, rely = .7) 

def ventana_modificando_paciente(dni, conexion):
    dni = dni.get()
    consulta = consultar_paciente(dni, conexion)
    win_modificando_paciente = tk.Tk()
    win_modificando_paciente.geometry("400x500")
    texto = "DNI: " + str(consulta[4]) 
    m_dni = tk.Label(win_modificando_paciente, text=texto, font=("Arial Bold",12))
    m_dni.place(anchor = 'center', relx = .2, rely = .1)

    m_seguridad = tk.Label(win_modificando_paciente, text="seguridad", font=("Arial Bold",8))
    m_seguridad.place(anchor = 'center', relx = .2, rely = .2)

    m_nombre = tk.Label(win_modificando_paciente, text="Nombre", font=("Arial Bold",8))
    m_nombre.place(anchor = 'center', relx = .2, rely = .3)

    m_Apellido1 = tk.Label(win_modificando_paciente, text="Apellido1", font=("Arial Bold",8))
    m_Apellido1.place(anchor = 'center', relx = .2, rely = .4)

    m_Apellido2 = tk.Label(win_modificando_paciente, text="Apellido2", font=("Arial Bold",8))
    m_Apellido2.place(anchor = 'center', relx = .2, rely = .5)

    m_fecha = tk.Label(win_modificando_paciente, text="fecha de nacimiento", font=("Arial Bold",8))
    m_fecha.place(anchor = 'center', relx = .2, rely = .6)

    t_seguridad = tk.Entry(win_modificando_paciente)
    t_seguridad.place(anchor = 'center', relx = .5, rely = .2)
    t_seguridad.insert(0, consulta[0])

    t_nombre = tk.Entry(win_modificando_paciente)
    t_nombre.place(anchor = 'center', relx = .5, rely = .3)
    t_nombre.insert(0, consulta[1])


    t_Apellido1 = tk.Entry(win_modificando_paciente,)
    t_Apellido1.place(anchor = 'center', relx = .5, rely = .4)
    t_Apellido1.insert(0, consulta[2])


    t_Apellido2 = tk.Entry(win_modificando_paciente)
    t_Apellido2.place(anchor = 'center', relx = .5, rely = .5)
    t_Apellido2.insert(0, consulta[3])
    
    t_fecha = tk.Entry(win_modificando_paciente,)
    t_fecha.place(anchor = 'center', relx = .5, rely = .6)
    t_fecha.insert(0, consulta[5])

    btn_enviar = tk.Button(win_modificando_paciente, text="Modificar",command = lambda:modificar_paciente(t_seguridad, consulta[4], t_nombre, t_Apellido1, t_Apellido2, t_fecha, datos_conexion.Conexion()))     
    btn_cerrar = tk.Button(win_modificando_paciente, text="Cerrar", command=win_modificando_paciente.destroy)
    btn_cerrar.place(anchor = 'center', relx = .60, rely = .7)
    btn_enviar.place(anchor = 'center', relx = .30, rely = .7)    

def ventana_eliminar_paciente():
    win_eliminar_paciente = tk.Tk()
    win_eliminar_paciente.geometry("400x200")
    m_dni = tk.Label(win_eliminar_paciente, text="ingrese el DNI del paciente", font=("Arial Bold",12))
    m_dni.place(anchor = 'center', relx = .5, rely = .3)
    t_dni = tk.Entry(win_eliminar_paciente)
    t_dni.place(anchor = 'center', relx = .5, rely = .5)
    btn_buscar = tk.Button(win_eliminar_paciente, text="ELIMINAR", command = lambda:eliminar_paciente(t_dni, datos_conexion.Conexion()))
    btn_buscar.place(anchor = 'center', relx = .5, rely = .7) 



def principal():
    base_datos = datos_conexion.Conexion()
    ventana = tk.Tk()
    ventana.geometry("300x400")

    mensaje = tk.Label(ventana, text="MENÚ PRINCIPAL", font=("Arial Bold", 18))
    #mensaje.grid(column=1, row=1,sticky='ew')
    mensaje.place(anchor = 'center', relx = .5, rely = .2) 

    btn_agregar_usuarios = tk.Button(ventana, text="Configuracion paciente",command = ventana_paciente)
    btn_agregar_usuarios.place(anchor = 'center', relx = .5, rely = .3)

    btn_crear_piso = tk.Button(ventana, text="Configuracion piso",command = ventana_planta)
    btn_crear_piso.place(anchor = 'center', relx = .5, rely = .4)


                                
    ventana.mainloop()

principal()