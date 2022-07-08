
from multiprocessing import freeze_support
from Guide_ausführen import run_guide
import pandas as pd
from ts_fresh import get_tsfresh_data
from Evaluation import complexity
from functools import partial
import datetime
import ReadVitalData
import ReadDrugsData
from PreprocessingData import get_final_klient_data, get_train_data, get_guide_data
from os import listdir
import numpy as np
from sklearn.model_selection import train_test_split
import string

if __name__ == '__main__':
    freeze_support()

    def create_datafiles(klient, n, ts_fresh_for_data, sampling_frequency):

        vital = ReadVitalData.vital
        mydi = ReadDrugsData.di
        klients = ReadVitalData.klients

        df = get_final_klient_data(klient, klients, vital, mydi, sampling_frequency)

        #spalten = [x for x in df.columns if x.startswith("Insulin") or x.startswith("Metformin") or
        #           x.startswith("Sitagliptin") or
        #           x in ["blutzucker", "gewicht", "sys"]]
        #df = df[spalten]
        spalten = [x.replace("ä","ae") for x in df.columns]
        #spalten2 = [x.replace("!@#$%^&*()[]{};:,./<>?\|`~-=+", "") for x in spalten]
        spalten2 = [x.translate(x.maketrans("!@#$%^&*()[]{};:,./<>?\|`~-=+", 29*"O"))[:30] for x in spalten]
        df.columns = spalten2

        x, y = get_train_data(df, n, sampling_frequency=sampling_frequency, m='max')

        if ts_fresh_for_data:
            z = get_tsfresh_data(x, y)
            z["y"] = y
            z.columns = [x.replace(",", "_") for x in z.columns]
            z.columns = [x.replace(" ", "_") for x in z.columns]
            if len(z.columns) < 2:
                return
            if len(z) < 20:
                return
            train_data_file = "train_all_data_"+str(klient)+"_"+str(n)+"_"+sampling_frequency+"_tsfresh.csv"
            z.to_csv(path_or_buf="Trainingsdaten/"+train_data_file, header=list(z.columns), index=False, na_rep="NA")
            return train_data_file

        else:
            guide_data = get_guide_data(x, y, n)
            guide_data.columns = [x.replace(",", "_") for x in guide_data.columns]
            guide_data.columns = [x.replace(" ", "_") for x in guide_data.columns]
            if len(guide_data.columns) < 2:
                return
            if len(guide_data) < 20:
                return
            train_data_file = "train_all_data_" + str(klient) + "_" + str(n) + "_" + sampling_frequency + "_end2end.csv"
            guide_data.to_csv(path_or_buf="Trainingsdaten/"+train_data_file, header=list(guide_data.columns), index=False, na_rep="NA")
            return train_data_file

    def generate_train_test(data_file):
        data = pd.read_csv("Daten/"+data_file)
        y = data.y
        X = data.drop('y', axis=1)
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
        train_data = pd.concat([X_train, y_train], axis=1)
        test_data = pd.concat([X_test, y_test], axis=1)
        columns = [x.replace("_(human)_","").replace("-","_") for x in test_data.columns]
        test_data.columns = columns
        train_data.columns = columns
        train_data.to_csv("Trainingsdaten/"+data_file, index=False)
        test_file_name = "test"+data_file[5:]
        test_data.to_csv("Testdaten/"+test_file_name, index=False)


    def create_datadesc(train_data_file):

        path = r"C:\Users\Caroline Kries\sciebo\Forschungsprojekt Medikamenteninteraktion\04_Quellcode\02_Python\GUIDE Masterarbeit\Trainingsdaten"
        dataframe = pd.read_csv(path+"/"+train_data_file)

        with open("data_desc.txt", "w") as file:
            file.write("Trainingsdaten\\" + train_data_file)
            file.write("\nNA")
            file.write("\n2")
            for count, col in enumerate(list(dataframe.columns)[:-1]):
                if col.startswith("blutzucker"):
                    role = " n"  # fitted, aber splittet nicht
                else:
                    role = " n"
                file.write(
                    "\n" + str(count + 1) + " " + col + role)  # alle variablen dürfen splitten und regressor sein
            file.write("\n" + str(len(list(dataframe.columns))) + " y d")

    def create_guide_tree(train_data, test_data, input_must_be_created=False):

        if input_must_be_created:
            import CreateInputfile

        input_file = "Input_ml.txt"
        r_file = "pred.r"
        latex_file_name = "tree"  #must be one of constant, simple or multiple

        run_guide(input_file, r_file, train_data, test_data)

    def terminal_nodes_of_guide(output_file = "Output_ml.txt"):
        number_of_final = complexity(output_file)
        #print(number_of_final)

        return number_of_final

    def error_of_guide(predictions_file, test_file):
        test_data = pd.read_csv(test_file)
        pred = pd.read_csv(predictions_file, sep=" ", header=None)
        pred = pred.transpose()
        pred.columns = ["y_dach"]

        y = test_data.iloc[:, -1]

        def absoluteerror (predictions, targets):
            return (np.abs(predictions - targets)).mean()

        def rmse(predictions, targets):
            return np.sqrt(((predictions - targets) ** 2).mean())

        def nrmse_range(predictions, targets):
            return rmse(predictions, targets) / (targets.max() - targets.min())

        return absoluteerror(pred.values, y.values), rmse(pred.values, y.values), nrmse_range(pred.values, y.values)


    """
    mypath = "C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/04_Quellcode/02_Python/GUIDE Masterarbeit/Daten/"
    trainfiles = [f for f in listdir(mypath)]

    data = [x.split("_") for x in trainfiles]
    df = pd.DataFrame(data)
    cols = df.columns[0:2]
    df.drop(columns=cols, inplace=True)
    df.columns = ["klient", "n", "samplingfrequency", "transformation2"]
    df["transformation"] = [x[:-4] for x in df.transformation2]
    df.drop(columns="transformation2", inplace=True)
    df["filename"] = trainfiles

    number_of_final_nodes = []
    rmse = []
    me = []
    nrmse_range = []

    for train in trainfiles:

        datafile = train
        train_data = "Trainingsdaten\\"+datafile
        test_data = "Testdaten/"+"test"+datafile[5:]

        generate_train_test(datafile)
        create_datadesc(datafile)
        create_guide_tree(train_data,test_data)
        t = terminal_nodes_of_guide()
        e1, e2, e3 = error_of_guide("predictions.csv",test_data)
        number_of_final_nodes.append(t)
        me.append(e1)
        rmse.append(e2)
        nrmse_range.append(e3)


    df["finalnodes"] = number_of_final_nodes
    df["rmse"] = rmse
    df["mae"] = me
    df["nrmse_range"] = nrmse_range


    today = datetime.date.today().strftime("%d%m%Y")
    name = "multiplelinear"+today
    df.to_csv(name)


    mypath = "C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/04_Quellcode/02_Python/GUIDE Masterarbeit/Trainingsdaten/"
    trainfiles = [f for f in listdir(mypath)]

    data = [x.split("_") for x in trainfiles]
    df = pd.DataFrame(data)
    cols = df.columns[0:2]
    df.drop(columns=cols, inplace=True)
    df.columns = ["klient", "n", "samplingfrequency", "transformation2"]
    df["transformation"] = [x[:-4] for x in df.transformation2]
    df.drop(columns="transformation2", inplace=True)
    df["filename"] = onlyfiles

    number_of_final_nodes = []

    for file in onlyfiles:
        create_datadesc(file)
        n_t = create_and_evaluate()
        number_of_final_nodes.append(n_t)
    df["finalnodes"] = number_of_final_nodes


    today = datetime.date.today().strftime("%d%m%Y")
    name = "multiplelinear"+today
    df.to_csv(name)


    # for n in [1,5]: #end to end 2/4/8 Wochen
    #     for sf in ["2w", "4w", "8w"]:
    #         results = list(map(partial(create_datafiles, n=n, ts_fresh_for_data=False, sampling_frequency=sf), klientenliste))
    #


    # for n in [1,5,10,20]:#end to end 1 Woche
    #     results = list(map(partial(create_datafiles, n=n, ts_fresh_for_data=False, sampling_frequency = '1w'),klientenliste))
    # for n in [5, 10,20]:
    #     list(map(partial(create_datafiles, n=n, ts_fresh_for_data=True, sampling_frequency = '1w'),klientenliste))
    #
    # for n in [5, 30, 50, 100]: #tsfresh 5, 30, 50, 100 Tage
    #     results = list(map(partial(create_datafiles, n=n, ts_fresh_for_data=True, sampling_frequency='1d'), klientenliste))

    """

    create_datafiles(180,1,False,'2w')





