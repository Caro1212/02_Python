import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.dates as mdates
import datetime

my_dia = pd.read_csv("C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/03_Daten/my_dia")
my_medi = pd.read_csv("C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/03_Daten/my_medi")
my_inhalt = pd.read_csv("C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/03_Daten/my_inhalt")


my_dia["giltab"] = pd.to_datetime(my_dia.giltab)
pzn_wirk = my_inhalt[["pzn","bezeichnung"]]
pzn_wirk = pzn_wirk.rename(columns={"pzn":"pzn","bezeichnung":"wirkstoff"})
my_medi_wirk = pd.merge(my_medi, pzn_wirk,how="left",on="pzn")
my_medi_wirk["tag"] = pd.to_datetime(my_medi_wirk["tag"])

klienten = my_dia.klientid.unique()

def plot_timeline(names, dates):
    # Choose some nice levels
    levels = np.tile([-7, 7, -5, 5, -3, 3, -1, 1],
                     int(np.ceil(len(dates)/6)))[:len(dates)]

    # Create figure and plot a stem plot with the date
    fig, ax = plt.subplots(figsize=(20, 10), constrained_layout=True)
    ax.set(title="Matplotlib release dates")

    markerline, stemline, baseline = ax.stem(dates, levels,
                                             linefmt="C3-", basefmt="k-",
                                             use_line_collection=True)

    plt.setp(markerline, mec="k", mfc="w", zorder=3)

    # Shift the markers to the baseline by replacing the y-data by zeros.
    markerline.set_ydata(np.zeros(len(dates)))

    # annotate lines
    vert = np.array(['top', 'bottom'])[(levels > 0).astype(int)]
    for d, l, r, va in zip(dates, levels, names, vert):
        ax.annotate(r, xy=(d, l), xytext=(-3, np.sign(l)*3),
                    textcoords="offset points", va=va, ha="right")

    # format xaxis with 4 month intervals
    ax.get_xaxis().set_major_locator(mdates.MonthLocator(interval=4))
    ax.get_xaxis().set_major_formatter(mdates.DateFormatter("%b %Y"))
    plt.setp(ax.get_xticklabels(), rotation=30, ha="right")

    # remove y axis and spines
    ax.get_yaxis().set_visible(False)
    for spine in ["left", "top", "right"]:
        ax.spines[spine].set_visible(False)

    ax.margins(y=0.1)
    plt.show()

def plot_diagnoses(klient):
    df1 = my_dia[my_dia.klientid == klient]
    names = list(df1.bezeichnung)
    dates = list(df1.giltab)
    plot_timeline(names, dates)


def plot_drugs(klient):
    medi1 = my_medi_wirk[my_medi_wirk.klientid == klient]
    df = medi1[["tag", "wirkstoff"]]
    df.dropna(how="any", inplace=True)

    names = list(df.wirkstoff)
    uniquenames = list(set(names))
    dates = list(df.tag)
    zip_list = list(zip(names, dates))

    #mydict = {"Medikament":[Timestamp1, Timestamp2, ...],...}
    mydict = {}
    for x in uniquenames:
        mydict[x] = []
        for z in zip_list:
            if z[0] == x:
                mydict[x].append(z[1])

    #begin = {"Medikament":[Timestamp1, Timestamp2, ...],...}
    # Timestamps geben ersten bzw. letzten Tag der Medikamentation an
    begin = {}
    end = {}
    for name in mydict.keys():
        newtime = [mydict[name][0]]
        endtime = []
        currenttime = mydict[name][0]
        for timestamp in mydict[name]:
            if timestamp - currenttime > datetime.timedelta(days=14):
                newtime.append(timestamp)
                endtime.append(currenttime)
            currenttime = timestamp
        endtime.append(mydict[name][-1])
        begin[name] = newtime
        end[name] = endtime

    #names und dates für die plot_timeline Methode mit je einem Zeitstempel für jedes Medikament
    names = []
    begin_dates = []
    end_dates = []
    for name in list(begin.keys()):
        timelist = begin[name]
        for time in timelist:
            names.append(name)
            begin_dates.append(time)
        timelist2 = end[name]
        for time in timelist2:
            end_dates.append(time)

    plot_timeline(names, begin_dates)

for k in klienten:
    try:
        plot_drugs(k)
    except:
        continue





