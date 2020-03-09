import data-storage.js
import json
import os
import pyodbc

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=RON\SQLEXPRESS;'
                      'Database=OneView;'
                      'Trusted_Connection=yes;')

cursor = conn.cursor()
cursor.execute('SELECT * FROM OneView.dbo.Patient_Info')

cursor.execute("INSERT INTO table VALUES (%s, %s, %s, %s, %s, %s, %s, %s)", (mr_num, firstname, lastname,birthdate,visit,history,visit_date,reason))
conn.commit()
