# create_db.py
import sqlite3

conn = sqlite3.connect("D:/sources-work/robot-framework-material/db_test/db/demo.db")
cursor = conn.cursor()
cursor.execute("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, email TEXT)")
cursor.execute("INSERT INTO users (name, email) VALUES ('John', 'john@email.com')")
cursor.execute("INSERT INTO users (name, email) VALUES ('Bob', 'bob@email.com')")
conn.commit()
conn.close()
