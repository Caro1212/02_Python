import pyodbc
import pyodbc
import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt
import numpy as np
from datetime import datetime, timedelta
import ReadVitalData
import ReadDrugsData

vital = ReadVitalData.vital
mydi = ReadDrugsData.di
klients = ReadVitalData.klients

myklient = klients[0]

""""""


mydi_klient = mydi[mydi.klientid2 == myklient]
medikamente = list(mydi_klient.inhaltsstoff.unique())
fig,axes=plt.subplots(len(medikamente)+1,1, sharex=True)
for i,m in enumerate(medikamente):
    df_temp = mydi_klient[mydi_klient.inhaltsstoff == m]
    df_temp = df_temp[["datum","eingenommene_menge"]]
    df_temp.sort_values(by='datum',inplace=True)
    df_temp.set_index("datum", inplace=True)
    df = df_temp.resample('1d').sum()
    axes[i].scatter(df.index, df.eingenommene_menge,label=m)
    axes[i].legend()
""""""
my = vital[vital.klientid2 == myklient]

my_bz = my[my.bezeichnung.isin(["Blutzucker", "Blutzucker mmol/l"])]
num = pd.to_numeric(my_bz.wert,errors='coerce')
my_bz["wert"] = num
my_bz.sort_values(by='datum',inplace=True)
my_bz_time = my_bz[["datum","wert"]]
df_time = my_bz_time.set_index("datum")
df_time_d = df_time.resample('1w').mean()

my_bd = my[my.bezeichnung.isin(["Blutdruck"])]
werte = list(my_bd.wert.apply(str))
sys = [float(x.split("/")[0]) if len(x)>1 else np.NaN for x in werte]
dia = [float(x.split("/")[1]) if len(x)>1 else np.NaN for x in werte]
my_bd["sys"] = sys
my_bd["dia"] = dia
my_bd.sort_values(by='datum',inplace=True)
my_bd.sys.describe()
my_bd_time = my_bd[["datum","sys", "dia"]]
df_time2 = my_bd_time.set_index("datum")
df_time2_d = df_time2.resample('1w').mean()

sys = df_time2_d.sys.interpolate(method = 'linear')
dia = df_time2_d.dia.interpolate(method = 'linear')
bz = df_time_d.wert.interpolate(method = 'linear')

start_date = max(df_time_d.index.min(), df_time2_d.index.min())
end_date = start_date + timedelta(days=150)
shift = timedelta(days=30)


axes[len(medikamente)].plot(bz[start_date+shift:end_date+shift],label="Blutzucker")
axes[len(medikamente)].plot(sys[start_date+shift:end_date+shift],label="Blutdruck sys")
axes[len(medikamente)].plot(dia[start_date+shift:end_date+shift],label="Blutdruck dia")
axes[len(medikamente)].legend()
fig.tight_layout()
plt.show()