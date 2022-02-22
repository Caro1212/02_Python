import pandas as pd
import numpy as np
from matlab_import import matlab_to_data
from sklearn.model_selection import train_test_split

def create_dataset(ts_size, filenames, train = True):

    system = "hammerstein"
    data = pd.read_csv(filenames[0], header=None)
    h_data = matlab_to_data(data=data, system=system, ts_size=ts_size, filename="hammerstein_data", write_csv=False)

    system="wiener"
    data = pd.read_csv(filenames[1], header=None)
    w_data = matlab_to_data(data, system, ts_size, filename="wiener_data", write_csv=False)

    system="nde"
    data = pd.read_csv(filenames[2], header=None)
    n_data = matlab_to_data(data, system, ts_size, filename="nde_data", write_csv=False)

    all_data = pd.concat([h_data,w_data,n_data], axis=0, ignore_index=True)
    #train, test = train_test_split(all_data, test_size=0.5)
    all_data.to_csv(path_or_buf="train_data.csv", header=list(all_data.columns), index=True)
    #test.to_csv(path_or_buf="test_data.csv", header=list(all_data.columns), index=True)

    if train:
        all_data.to_csv(path_or_buf="train_data.csv", header=list(all_data.columns), index=True)
        with open("data_desc.txt", "w") as file:
            file.write("train_data.csv")
            file.write("\nNA")
            file.write("\n2")
            file.write("\n1 index x")
            for count,i in enumerate(list(all_data.columns)[:-2]):
                file.write("\n"+str(count+2)+" "+str(i)+" n")
            file.write("\n"+"21 "+str(all_data.columns[-2])+" d")
            file.write("\n"+"22 cat"+" b")
    else:
        all_data.to_csv(path_or_buf="test_data.csv", header=list(all_data.columns), index=True)