#%%
import pyodbc
import pyodbc
import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt
import numpy as np

#%%
klients = []
with open("patientenliste.txt", "r") as patienten:
	lines = patienten.readlines()

klients = [int(x.replace("\n","")) for x in lines]


klients01 = tuple([str(x)[:-2] for x in klients if x%10==1])
klients02 = tuple([str(x)[:-2] for x in klients if x%10==2])
klients03 = tuple([str(x)[:-2] for x in klients if x%10==3])


connection = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="FH_Master_2122",
    database="forschung"
)

cursor = connection.cursor()
#sql_query = "SELECT * FROM diagnosen WHERE KlientId IN"+str(klients01)"
#cursor.execute(sql_query)
#myresult = cursor.fetchall()

#diagnoses = pd.DataFrame(myresult, columns = ['id', 'klientid','giltab','giltbis','bezeichnung','code','status','statusname'])
"""
a = diagnoses.bezeichnung.unique()
diabetes = []
for dia in list(a):
    try:
        if "diab" in dia:
            diabetes.append(dia)
    except:
        continue
diab_diagnoses = diagnoses[diagnoses.bezeichnung.isin(diabetes)]
klienten1 = list(diab_diagnoses.klientid.unique())
#klientenF1 = [int(str(id)+"01") for id in klienten]
"""

sql_query = "SELECT * FROM vitalwerte WHERE KlientId IN" + str(klients01)
cursor.execute(sql_query)
myresult = cursor.fetchall()
vital1 = pd.DataFrame(myresult, columns = ['id', 'klientid','datum','bezeichnung','wert','einheit','wurdeunterschritten','wurdeueberschritten'])


vital1["klientid2"] = vital1["klientid"]*100 +1
klienten21 = list(vital1.klientid2.unique())

#%%

cursor.close()
connection.disconnect()



#%%
# Trusted Connection to Named Instance
connection = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                            'SERVER=pc-caro;DATABASE=Forschung02;'
                            'Trusted_Connection=yes;')
cursor=connection.cursor()
#%%
#diagnoses = pd.read_sql_query('SELECT * FROM diagnosen', connection)
#diagnoses.columns = ['id', 'klientid','giltab','giltbis','bezeichnung','code','status','statusname']
#a = diagnoses.bezeichnung.unique()

#%%
sql_query = "SELECT * FROM vitalwerte WHERE KlientId IN"+str(klients02)
vital2 = pd.read_sql_query(sql_query, connection)
vital2.columns = ['id', 'klientid','datum','bezeichnung','wert','einheit','wurdeunterschritten','wurdeueberschritten']

vital2["klientid2"] = vital2["klientid"]*100 +2
#%%
cursor.close()
connection.close()

#%%

# Trusted Connection to Named Instance
connection = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                            'SERVER=pc-caro;DATABASE=Forschung03;'
                            'Trusted_Connection=yes;')
cursor=connection.cursor()
#%%
#diagnoses = pd.read_sql_query('SELECT * FROM diagnosen', connection)
#diagnoses.columns = ['id', 'klientid','giltab','giltbis','bezeichnung','code','status','statusname']
# = diagnoses.bezeichnung.unique()
#diabetes = []
#for dia in list(a):
#    try:
#         if "diab" in dia:
#             diabetes.append(dia)
#     except:
#         continue
# diab_diagnoses = diagnoses[diagnoses.bezeichnung.isin(diabetes)]
# klienten3 = list(diab_diagnoses.klientid.unique())
#%%
sql_query = "SELECT * FROM vitalwerte WHERE KlientId IN" + str(klients03)
vital3 = pd.read_sql_query(sql_query, connection)
vital3.columns = ['id', 'klientid','datum','bezeichnung','wert','einheit','wurdeunterschritten','wurdeueberschritten']

vital3["klientid2"] = vital3["klientid"]*100 +3
#%%
cursor.close()
connection.close()