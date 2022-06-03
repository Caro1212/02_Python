import numpy as np
from datetime import datetime, timedelta
import ReadVitalData
import ReadDrugsData
import pandas as pd
from functools import reduce


vital = ReadVitalData.vital
mydi = ReadDrugsData.di
klients = ReadVitalData.klients

#Vitalwerte

myklient = klients[133]
df = vital[vital.klientid2 == myklient]

#Blutzucker
bz = df[df.bezeichnung.isin(["Blutzucker", "Blutzucker mmol/l"])]
num = pd.to_numeric(bz.wert,errors='coerce')
bz["wert"] = num
bz.sort_values(by='datum',inplace=True)
bz = bz[["datum","wert"]]
bz.columns = ["datum", "blutzucker"]
bz = bz.set_index("datum")
bz = bz.resample('1d').mean()

#Gewicht

gw = df[df.bezeichnung == "Gewicht"]
num = [float(str(x).replace(",",".")) for x in gw.wert]
gw["wert"] = num
gw.sort_values(by='datum',inplace=True)
gw = gw[["datum","wert"]]
gw.columns = ["datum", "gewicht"]
gw = gw.set_index("datum")
gw.index = [d.date() for d in gw.index]

#bmi
bmi = df[df.bezeichnung == "BMI"]
num = [float(str(x).replace(",",".")) for x in bmi.wert]
bmi["wert"] = num
bmi.sort_values(by='datum',inplace=True)
bmi = bmi[["datum","wert"]]
bmi.columns = ["datum", "bmi"]
bmi = bmi.set_index("datum")
bmi.index = [d.date() for d in bmi.index]

#Blutdruck

bd = df[df.bezeichnung == "Blutdruck"]
werte = list(bd.wert.apply(str))
sys = [float(x.split("/")[0]) if len(x)>1 else np.NaN for x in werte]
dia = [float(x.split("/")[1]) if len(x)>1 else np.NaN for x in werte]

bd["sys"] = sys
bd["dia"] = dia
bd.sort_values(by='datum',inplace=True)
syst = bd[["datum","sys"]]
syst = syst.set_index("datum")
syst = syst.resample('1d').mean()

dia = bd[["datum","dia"]]
dia = dia.set_index("datum")
dia = dia.resample('1d').mean()

#Medikamente
mdf = mydi[mydi.klientid2 == myklient]
medi = list(mdf.inhaltsstoff.unique())

a = medi[0]
adf = mdf[mdf.inhaltsstoff == a]
adf = adf[["datum","eingenommene_menge"]]
adf.columns = ["datum",a]
adf.sort_values(by='datum',inplace=True)
adf.set_index("datum",inplace=True)
adf = adf.resample('1d').sum()

for b in medi[1::]:

    bdf = mdf[mdf.inhaltsstoff == b]
    bdf = bdf[["datum","eingenommene_menge"]]
    bdf.columns = ["datum",b]
    bdf.sort_values(by='datum',inplace=True)
    bdf.set_index("datum",inplace=True)
    bdf = bdf.resample('1d').sum()

    adf = adf.join(bdf, lsuffix='_caller', rsuffix='_other',how='outer').fillna(0)

#wenn Medikamente komplett 0 sind, entfernen
adf = adf.loc[:, (adf != 0).any(axis=0)]

#join alle dfs
dfs = [adf, bz, syst, dia, gw, bmi]
final_df = reduce(lambda  left,right: pd.merge(left,right,left_index=True, right_index=True,
                                            how='outer'), dfs)
#resample auf eine Woche
final_df.resample('1w').mean()

#interploiere fehlende Werte
for vital in ["sys","dia","blutzucker","bmi","gewicht"]:
    final_df[vital].interpolate(method = 'linear',inplace=True)