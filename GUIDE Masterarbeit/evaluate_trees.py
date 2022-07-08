import pandas as pd
import numpy as np

slresults = pd.read_csv("simplelinear29062022", index_col = 0)
sl = slresults[["klient","n","samplingfrequency","transformation","finalnodes"]]
tsfreshlist = list(zip(8*["tsfresh"],4*["1d"]+4*["1w"],[5,30,50,100,1,5,10,20]))
end2endlist = list(zip(10*["end2end"],4*["1w"]+2*["2w"]+2*["4w"]+2*["8w"], [1,5,10,20,1,5,1,5,1,5,1,5]))
myindex = end2endlist + tsfreshlist

mydf = pd.DataFrame(index=myindex)
klienten = [90]
k= 90
for mi in myindex:
    werte = []
    df = slresults[slresults.klient == k]
    w = df.loc[((df['transformation'] == mi[0]) & (df['samplingfrequency'] == mi[1]) & (df["n"] == mi[2]))].finalnodes.values
    if w.shape[0] == 0:
        w = np.array([-99])
    werte.append(w[0])
werte