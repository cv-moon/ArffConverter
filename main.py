# #---------------Código para convertir a arff un csv y también delimitar a utf-8-----------------
# import csv
import pandas as pd
import psycopg2

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

# # -----------------------Código para insertar a base de datos.
#

# Conectarse a la base de datos
connection = psycopg2.connect(
    port=5432,
    database="proyecto_mineriadb",
    user="postgres",
    password="CVsql2024"
)
#
# # Ejecutar una consulta SQL
# cursor = connection.cursor()
#
# cursor.execute("INSERT INTO usuarios (nombre, clave) VALUES ('Paola', 'test2024')")
# cursor.execute("INSERT INTO usuarios (nombre, clave) VALUES ('Pamela', 'test2024')")
# connection.commit()
# # cursor.execute("SELECT * FROM usuarios")
# # #
# # # Imprimir los resultados
# # for row in cursor:
# #     print(row)
#
# # Cerrar la conexión
# connection.close()

# -----------------------Código para leer excel.
ruta_archivo = "Excel/PERIODO 2021 - 1.xlsx"
df = pd.read_excel(ruta_archivo, dtype={"IDENTIFICACIÓN": "str", "FIJO": "str", "MOVIL": "str"})
# print(df.head())
# Ete código valida la existencia de carreras en la base y si no existen registradas, las registra.
columna_genero = df["CARRERA"]
genero_unicos = columna_genero.unique()
cursor = connection.cursor()
cursor.execute("SELECT * FROM carreras")
genero_db = [fila[1] for fila in cursor.fetchall()]
for dato in genero_unicos:
    if dato not in genero_db:
        sql = """
                    INSERT INTO carreras (car_nombre)
                    VALUES (%s)
                """
        cursor.execute(sql, (dato,))
connection.commit()

# En este código también se realizará la verificación e inserción de datos de no exister en torno a las modalidades
columna_genero = df["MODALIDAD"]
genero_unicos = columna_genero.unique()
cursor.execute("SELECT * FROM modalidades")
genero_db = [fila[1] for fila in cursor.fetchall()]
for dato in genero_unicos:
    if dato not in genero_db:
        sql = """
                    INSERT INTO modalidades (mod_nombre)
                    VALUES (%s)
                """
        cursor.execute(sql, (dato,))
connection.commit()

# En este código también se realizará la verificación e inserción de datos de no exister en torno al género
columna_genero = df["GÉNERO"]
genero_unicos = columna_genero.unique()
cursor.execute("SELECT * FROM generos")
genero_db = [fila[1] for fila in cursor.fetchall()]
for dato in genero_unicos:
    if dato not in genero_db:
        sql = """
                    INSERT INTO generos (gen_nombre)
                    VALUES (%s)
                """
        cursor.execute(sql, (dato,))
connection.commit()

for fila in df.itertuples():
    # print(fila)
    columna_modalidad = fila.MODALIDAD
    # Consultar la base de datos para obtener el ID del dato
    sql = """
        SELECT id_modalidad
        FROM modalidades
        WHERE mod_nombre = %s
    """
    cursor.execute(sql, (columna_modalidad,))
    id_modalidad = cursor.fetchone()[0]

    columna_genero = fila.GÉNERO
    sql = """
        SELECT id_genero
        FROM generos
        WHERE gen_nombre = %s
    """
    cursor.execute(sql, (columna_genero,))
    id_genero = cursor.fetchone()[0]

    columna_carrera = fila.CARRERA
    sql = """
            SELECT id_carrera
            FROM carreras
            WHERE car_nombre = %s
        """
    cursor.execute(sql, (columna_carrera,))
    id_carrera = cursor.fetchone()[0]

    # print(f"{fila.NOMBRES}, {id_modalidad}, {id_genero}")
    # Registrar el ID en la otra tabla
    sql = """
        INSERT INTO estudiantes (nombres, apellidos, num_identificacion, fecha_nacimiento, sector_residencia, telefono_fijo,
        telefono_celular, email_personal, discapacidad, id_genero)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """
    if fila.DISCAPCIDAD == "SI":
        discapacidad = True
    else:
        discapacidad = False
    cursor.execute(sql, (fila.NOMBRES, fila.APELLIDOS, fila.IDENTIFICACIÓN, fila._13, fila._20, fila.FIJO, fila.MOVIL,
                         fila._27, discapacidad, id_genero,))

    print(cursor.)

#     sql = """
#                 SELECT id_estudiante
#                 FROM estudiantes
#                 WHERE id_estudiante = %s
#             """
#     cursor.execute(sql, (id_estudiante,))
#     id_estudiante = cursor.fetchone()
#     print(id_estudiante)
#
#     sql = """
#            INSERT INTO matriculas (id_estudiante, id_periodo, id_carrera, id_modalidad, num_matricula, fecha_inscripcion,
#            formalizado, retirado)
#            VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
#        """
#     if fila.FORMALIZADO == "SI":
#         formalizado = True
#     else:
#         formalizado = False
#
#     if fila.RETIRADO == "SI":
#         retirado = True
#     else:
#         retirado = False
#     cursor.execute(sql, (id_estudiante, 1, id_carrera, id_modalidad, fila.MATRICULA, fila._21, formalizado,
#                          retirado,))
#
# connection.commit()
