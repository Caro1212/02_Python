import mysql.connector
import pandas as pd
import numpy as np


#Connection to the Database
mydb = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="FH_Master_2122",
    database="forschung"
)


'''
Tabellen werden gefiltert. Wir betrachten nur Fälle, die in Verbindung mit Diabetes entstehen. Aus den Diagnosen werden 
die Klienten gefiltert, die eine Diabeteskrankheit haben. Dann werden diejenigen ausgewählt, die bei den Vitalparametern mehr 
als 100 Messzeitpunkte aufweisen können. Diese Klienten bestimmen die Filterung der 
'''
#Diagnosen - wähle diejenigen Klienten aus, die eine in Verbindung mit Diabetes stehende Krankheit haben
mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM diagnosen")
myresult = mycursor.fetchall()

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
klienten = list(diab_diagnoses.klientid.unique())


#Vitalwerte - wähle die Vitalwerte von den Diabetespatienten aus, die mehr als 100 Messungen aufweisen.
mycursor.execute("SELECT * FROM vitalwerte")
myresult = mycursor.fetchall()

vp = pd.DataFrame(myresult, columns = ['id', 'klientid','datum','bezeichnung','wert','einheit','wurdeunterschritten','wurdeueberschritten'])

vp_filter = vp[vp.klientid.isin(klienten)]
vp_filter = vp_filter[vp_filter.bezeichnung.isin(["Blutzucker","Blutdruck","Gewicht","Größe","BMI"])]

vp_blutzucker = vp_filter[vp_filter.bezeichnung == 'Blutzucker']
anzahl = vp_blutzucker.klientid.value_counts()
klienten = list(anzahl[anzahl > 100].index)

#Medikamentengaben
mycursor.execute("SELECT * FROM medikamentgaben")
myresult = mycursor.fetchall()
medi = pd.DataFrame(myresult, columns=['id','klientid','tag','datum','bezeichnung','pzn','menge','einheit','atccode'])
medi_filter = medi[medi.klientid.isin(klienten)]
medi_pzn = list(medi.pzn.unique())

#Medikamenteninhaltsstoffe für die Medikamente aus Medikamentengaben
mycursor.execute("SELECT * FROM medikamentinhaltsstoffe")
myresult = mycursor.fetchall()
inhalt = pd.DataFrame(myresult, columns = ['id','pzn','bezeichnung','menge','einheit'])
inhalt_filter = inhalt[inhalt.pzn.isin(medi_pzn)]


#update Diagnosen; rename die übrigen Tabellen
my_dia = diagnoses[diagnoses["klientid"].isin(klienten)]
my_vp = vp_filter
my_medi = medi_filter
my_inhalt = inhalt_filter



'''
Ändere die Datatypes: DateTime, float
'''
#Diagnosen
my_dia["giltab"] = pd.to_datetime(my_dia.giltab)
my_dia["giltbis"] = pd.to_datetime(my_dia.giltbis)

#Vitalparameter
werte = list(my_vp.wert.apply(str))
werte = [w.replace(',','.') for w in werte]
neu = [float(x.split("/")[0]) if len(x)>1 else np.NaN for x in werte]
my_vp["werte"] = neu

#füge die Spalte Tageszeiten hinzu, um Vitalparameter nach Tageszeit zu filtern
my_vp["datum"] = pd.to_datetime(my_vp.datum)
daten = list(my_vp.datum)
tageszeiten = []
for x in daten:
    if x.hour < 10 and x.hour > 5:
        tageszeit = "morgens"
    elif x.hour < 15:
        tageszeit = "mittags"
    elif x.hour < 18:
        tageszeit = "nachmittags"
    else:
        tageszeit = "abends"
    tageszeiten.append(tageszeit)
my_vp["tageszeit"] = tageszeiten

#Medikamente
my_medi["tag"] = pd.to_datetime(my_medi.tag)
my_medi["datum"] = pd.to_datetime(my_medi.datum)
my_medi = my_medi.drop("atccode", axis=1)



'''
Schreibe die ausgewählten Daten als csv-Dateien 
'''
my_vp.to_csv("C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/03_Daten/my_vp")
my_medi.to_csv("C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/03_Daten/my_medi")
my_dia.to_csv("C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/03_Daten/my_dia")
my_inhalt.to_csv("C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/03_Daten/my_inhalt")
