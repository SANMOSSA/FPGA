import mysql.connector
from mysql.connector import Error

class Conexion(object):

    connection = None
    cursor = None

    def __init__(self):
        if self.connection is None:
            try:
                self.connection = mysql.connector.connect(host='localhost', database='hsmdb', user='root', password='')
                self.cursor = self.connection.cursor()
            except Exception as error:
                print("Error: Connection not established {}".format(error))
        else:
            print("Connection established")

        self.connection = self.connection
        self.cursor = self.cursor