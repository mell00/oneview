import os
import pyodbc

if start = 'import':

driver = pyodbc.drivers()

conn = pyodbc.connect(('Driver={};Server=DESKTOP-TVBHO64\SQLEXPRESS;Database=OneView;Trusted_Connection=yes;').format(driver))

cursor = conn.cursor()
cursor.execute('SELECT * FROM OneView.dbo.Patient_Info')

cursor.execute('INSERT INTO OneView VALUES {%s, %s, %s, %s, %s, %s, %s, %s}').format(ip_mr_num, ip_firstname,ip_lastname,ip_birthdate,ip_visit,ip_history,ip_visit_date,ip_reason))
conn.commit()

else if start = 'export':

driver = pyodbc.drivers()

conn = pyodbc.connect(('Driver={};Server=DESKTOP-TVBHO64\SQLEXPRESS;Database=OneView;Trusted_Connection=yes;').format(driver))

cursor = conn.cursor()
cursor.execute('SELECT * FROM OneView.dbo.Patient_Info')

cursor.execute('DELETE FROM OneView VALUES {%s, %s, %s, %s, %s, %s, %s, %s}').format(ip_mr_num, ip_firstname,ip_lastname,ip_birthdate,ip_visit,ip_history,ip_visit_date,ip_reason))
conn.commit()
© 2020 GitHub, Inc.
