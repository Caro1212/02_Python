
import pyodbc
import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt
import numpy as np

klients = []
with open("patientenliste.txt", "r") as patienten:
	lines = patienten.readlines()

klients = [int(x.replace("\n","")) for x in lines]

#%%

klients01 = tuple([str(x)[:-2] for x in klients if x%10==1])
klients02 = tuple([str(x)[:-2] for x in klients if x%10==2])
klients03 = tuple([str(x)[:-2] for x in klients if x%10==3])

#%%

connection = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="FH_Master_2122",
    database="forschung"
)

cursor = connection.cursor()

sql_query = "SELECT * FROM medikamentgaben WHERE KlientId IN"+str(klients01)
cursor.execute(sql_query)
myresult = cursor.fetchall()
drugs01 = pd.DataFrame(myresult, columns = ['id', 'klientid','datum','zeitpunkt',
                                          'bezeichnung','pzn','menge','einheit','atccode'])


drugs01["klientid2"] = drugs01["klientid"]*100 +1
drugs01 = drugs01[drugs01.klientid2.isin(klients)]

cursor.execute("SELECT * FROM medikamentinhaltsstoffe")
myresult = cursor.fetchall()
inhalt01 = pd.DataFrame(myresult, columns = ['id', 'pzn','bezeichnung','menge','einheit'])

cursor.close()
connection.disconnect()

#%%

connection = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                            'SERVER=pc-caro;DATABASE=Forschung02;'
                            'Trusted_Connection=yes;')
cursor=connection.cursor()

sql_query = "SELECT * FROM medikamentgaben WHERE KlientId IN"+str(klients02)

drugs02 = pd.read_sql_query(sql_query, connection)
drugs02.columns = ['id', 'klientid','datum','zeitpunkt',
                'bezeichnung','pzn','menge','einheit','atccode']


drugs02["klientid2"] = drugs02["klientid"]*100 +2
drugs02 = drugs02[drugs02.klientid2.isin(klients)]

inhalt02 = pd.read_sql_query('SELECT * FROM medikamentinhaltsstoffe', connection)
inhalt02.columns = ['id', 'pzn','bezeichnung','menge','einheit']

cursor.close()
connection.close()

#%%

connection = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                            'SERVER=pc-caro;DATABASE=Forschung03;'
                            'Trusted_Connection=yes;')
cursor=connection.cursor()
sql_query = "SELECT * FROM medikamentgaben WHERE KlientId IN"+str(klients03)

drugs03 = pd.read_sql_query(sql_query, connection)
drugs03.columns = ['id', 'klientid','datum','zeitpunkt',
                'bezeichnung','pzn','menge','einheit','atccode']


drugs03["klientid2"] = drugs03["klientid"]*100 +3
drugs03 = drugs03[drugs03.klientid2.isin(klients)]

inhalt03 = pd.read_sql_query('SELECT * FROM medikamentinhaltsstoffe', connection)
inhalt03.columns = ['id', 'pzn','bezeichnung','menge','einheit']

cursor.close()
connection.close()

drugs = pd.concat([drugs01, drugs02, drugs03], ignore_index=True)
inhalt = pd.concat([inhalt01, inhalt02, inhalt03], ignore_index=True)
myinhalt = inhalt[["pzn","bezeichnung","menge","einheit"]]
di = pd.merge(drugs, myinhalt, on='pzn', how='inner')
di.columns = ["id","klientid","datum","zeitpunkt","medikamentbezeichnung",
              "pzn","anzahl_eingenommen","einheit_eingenommen","atccode","klientid2",
              "inhaltsstoff","menge_pro_medikament","einheit"]

top50 = list(di.inhaltsstoff.value_counts()[:50].index)
top10_ohneInsulin=[]
# for x in top10:
#     if x.startswith("Insulin"):
#         continue
#     else:
#         top10_ohneInsulin.append(x)


di["eingenommene_menge"] = di["anzahl_eingenommen"]*di["menge_pro_medikament"]

top50=di.inhaltsstoff.value_counts()[:47].index

klasse = "Diabetes Blutdruck Schmerz Blutdruck Diabetes Diabetes Blutverdünnung Diabetes Diabetes Magenschutz Blutdruck Cholesterinsenker Schilddrüsenhormon Blutdruck Diabetes Blutdruck Blutverdünnung Mineralstoff Schmerz Parkinson Diabetes Säure-Basen-Puffer Diabetes Blutdruck Mineralstoff Beruhigung Abführmittel Schmerz Blutdruck Gicht Vitamin Diabetes Schmerz Schmerz Beruhigung Abführmittel Parkinson Diabetes Blutdruck Vitamin Asthma Depression Depression Beruhigung Blutdruck Blutdruck Augendruck"
klasse = klasse.split()
mydict = dict(zip(list(top50.values), klasse))
mydict["Acetylcystein"] = "Hustenlöser"
mydict["Amoxicillin-3-Wasser"] = "Antibiotikum"
mydict["Cefuroxim axetil"] = "Antibiotikum"
mydict["Ciprofloxacin hydrochlorid-1-Wasser"] = "Antibiotikum"
mydict["Clavulansäure kalium"] = "Antibiotikum"
mydict["Clotrimazol"] = "Pilz"
mydict["Co-trimoxazol"] = "Antibiotikum"
mydict["Colecalciferol, ölige Lösungen"] = "Vitamin"
mydict["Eisen(II)-glycin-sulfat-Komplex"] = "Mineralstoff"
mydict["Enoxaparin natrium"] = "Blutverdünnung"
mydict["Flupredniden 21-acetat"] = "Hautentzündung"
mydict["Folsäure"] = "Folsäure"
mydict["Gentamicin sulfat"] = "Antibiotikum"
mydict["Hydrochlorothiazid"] = "Blutdruck"
mydict["Ibuprofen"] = "Schmerz"
mydict["Metoclopramid hydrochlorid-1-Wasser"] = "Übelkeit"
mydict["Miconazol nitrat"] = "Pilz"
mydict["Nystatin"] = "Pilz"
mydict["Paracetamol"] = "Schmerz"
mydict["Pipamperon dihydrochlorid"] = "Beruhigung"
mydict["Prednisolon"] = "Kortison"
mydict["Xipamid"] = "Blutdruck"
mydict["Zinkoxid"] = "Wundheilung"
mydict["Zopiclon"] = "Beruhigung"

di["verwendung"] = di["inhaltsstoff"].map(mydict)