from Guide_ausführen import run_guide
import pandas as pd
from Evaluation import complexity
import numpy as np
from sklearn.model_selection import train_test_split


def generate_train_test(data_file):
    data = pd.read_csv("Daten/" + data_file)
    y = data.y
    X = data.drop('y', axis=1)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    train_data = pd.concat([X_train, y_train], axis=1)
    test_data = pd.concat([X_test, y_test], axis=1)
    columns = [x.replace("_(human)_", "").replace("-", "_") for x in test_data.columns]
    test_data.columns = columns
    train_data.columns = columns
    train_data.to_csv("Trainingsdaten/" + data_file, index=False)
    test_file_name = "test" + data_file[5:]
    test_data.to_csv("Testdaten/" + test_file_name, index=False)


def create_datadesc(train_data_file):
    path = r"C:\Users\Caroline Kries\sciebo\Forschungsprojekt Medikamenteninteraktion\04_Quellcode\02_Python\GUIDE Masterarbeit\Trainingsdaten"
    dataframe = pd.read_csv(path + "/" + train_data_file)

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
    input_file = "Input_sl.txt"
    r_file = "pred.r"
    latex_file_name = "tree"
    run_guide(input_file, r_file, train_data, test_data, latex_file_name)


def terminal_nodes_of_guide(output_file="Output_sl.txt"):
    number_of_final = complexity(output_file)
    return number_of_final


def error_of_guide(predictions_file, test_file):
    test_data = pd.read_csv(test_file)
    pred = pd.read_csv(predictions_file, sep=" ", header=None)
    pred = pred.transpose()
    pred.columns = ["y_dach"]

    y = test_data.iloc[:, -1]

    def absoluteerror(predictions, targets):
        return (np.abs(predictions - targets)).mean()

    def rmse(predictions, targets):
        return np.sqrt(((predictions - targets) ** 2).mean())

    def nrmse_range(predictions, targets):
        return rmse(predictions, targets) / (targets.max() - targets.min())

    return absoluteerror(pred.values, y.values), rmse(pred.values, y.values), nrmse_range(pred.values, y.values)
#
datafiles = ["train_all_data_180_100_1d_tsfresh.csv","train_all_data_180_30_1d_tsfresh.csv","train_all_data_180_20_1w_tsfresh.csv",
             "train_all_data_180_1_1w_end2end.csv","train_all_data_180_1_2w_end2end.csv"]

datafiles = ["train_data_180_100_1d_tsfresh.csv","train_data_180_30_1d_tsfresh.csv","train_data_180_20_1w_tsfresh.csv",
             "train_data_180_1_1w_end2end.csv","train_data_180_1_2w_end2end.csv"]


terminalnodes = []
mae = []
nrmse = []
for i,datafile in enumerate(datafiles):
    #datafile = "train_all_data_180_100_1d_tsfresh.csv"
    train_data = "Trainingsdaten\\"+datafile
    test_data = "Testdaten/"+"test"+datafile[5:]

    generate_train_test(datafile)
    create_datadesc(datafile)
    create_guide_tree(train_data,test_data,False)
    t = terminal_nodes_of_guide()
    e1, e2, e3 = error_of_guide("predictions.csv",test_data)
    #print("MAE: ", e1, "    NRMSE: ", e3)
    terminalnodes.append(t)
    mae.append(e1)
    nrmse.append(e3)

index = [x+"_nn" for x in datafiles]
df = pd.DataFrame(index=datafiles)
df["terminalnodes"] = terminalnodes
df["mae"] = mae
df["nrmse"] = nrmse

df.to_csv("individualresults_180.csv",mode='a', header=False)