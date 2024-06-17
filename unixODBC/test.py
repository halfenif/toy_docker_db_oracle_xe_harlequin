import pyodbc

try:
    conn = pyodbc.connect('DRIVER=oracle;DBQ=localhost:1521/XE;UID=userdb;PWD=userdb')
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM your_table")
    rows = cursor.fetchall()
        for row in rows:
            print(row)
    cursor.close()
    conn.close()

except pyodbc.Error as e:
    print(f"Error connecting to database: {e}")