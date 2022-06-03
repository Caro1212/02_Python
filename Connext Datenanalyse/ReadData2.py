import pyodbc
import pyodbc
import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt
import numpy as np


connection = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="FH_Master_2122",
    database="forschung"
)

cursor = connection.cursor()
cursor.execute("SELECT * FROM diagnosen")
myresult = cursor.fetchall()

diagnoses = pd.DataFrame(myresult, columns = ['id', 'klientid','giltab','giltbis','bezeichnung','code','status','statusname'])

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

cursor.execute("SELECT * FROM medikamentgaben")
myresult = cursor.fetchall()
vital1 = pd.DataFrame(myresult, columns = ['id', 'klientid','datum','bezeichnung','wert','einheit','wurdeunterschritten','wurdeueberschritten'])
vital1 = vital1[vital1.klientid.isin(klienten1)]

vital1["klientid2"] = vital1["klientid"]*100 +1
klienten21 = list(vital1.klientid2.unique())

#%%

cursor.close()
connection.disconnect()