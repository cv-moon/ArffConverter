# #---------------Código para convertir a arff un csv y también delimitar a utf-8-----------------
# import csv
# import openpyxl
# import unidecode
# import datetime
#
# # Abre el archivo XLSX
# xlsx_file = openpyxl.load_workbook("listado_general.xlsx")
#
# # Obtiene la hoja de trabajo activa
# sheet = xlsx_file.active
#
# # Abre el archivo CSV
# with open("archivo.csv", "w", newline="") as csvfile:
#
#   # Crea un escritor de CSV
#   writer = csv.writer(csvfile, delimiter=",")
#
#   # Itera sobre las filas de la hoja de trabajo
#   for row in sheet.iter_rows():
#
#     # Itera sobre las columnas de la fila
#     row_values = []
#     for cell in row:
#       value = cell.value
#       if isinstance(value, datetime.datetime):
#         value = value.isoformat()  # Convierte el objeto datetime a una cadena
#       elif isinstance(value, str):  # Solo aplica unidecode a valores que son cadenas
#         value = unidecode.unidecode(value)
#       row_values.append(value)
#
#     # Escribe la fila en el archivo CSV
#     writer.writerow(row_values)

# -----------------------Código para insertar a base de datos.

import psycopg2

# Conectarse a la base de datos
connection = psycopg2.connect(
    port=5432,
    database="test",
    user="postgres",
    password="CVsql2024",
)

# Ejecutar una consulta SQL
cursor = connection.cursor()

cursor.execute("INSERT INTO usuarios (nombre, clave) VALUES ('Paola', 'test2024')")
cursor.execute("INSERT INTO usuarios (nombre, clave) VALUES ('Pamela', 'test2024')")
connection.commit()
# cursor.execute("SELECT * FROM usuarios")
# #
# # Imprimir los resultados
# for row in cursor:
#     print(row)

# Cerrar la conexión
connection.close()
