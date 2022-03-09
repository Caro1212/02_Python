import tsfresh
import os
import pandas as pd
from tsfresh import extract_relevant_features
from multiprocessing import freeze_support
from tsfresh import extract_features
from tsfresh import select_features
from tsfresh.utilities.dataframe_functions import impute
from tsfresh.feature_extraction.settings import MinimalFCParameters
from sklearn.model_selection import train_test_split

import numpy as np

#if __name__ == '__main__' or 1 == 1:
 #   freeze_support()

def ts_extracting(datafile, train):
    data = pd.read_csv(datafile, sep=",", index_col=0)
    data = data.fillna(value=100)
    data_size = len(data)

    mydata = data.transpose()
    my_y = data.iloc[:, -2]
    my_cat = data.iloc[:,-1]

    mydata = mydata.drop(mydata.index[[-1, -2]]) #drop category and y

    new = mydata.values.transpose().reshape(-1, 1)

    id_list = []
    for x in range(data_size):
        id_list.extend(len(mydata) * [x])
    my_id = pd.Series(id_list)

    tsdata = pd.DataFrame()
    tsdata["id"] = my_id
    tsdata["time"] = data_size * [x for x in range(len(mydata))]
    tsdata["value"] = new

    extracted_features = extract_features(tsdata, column_id="id", column_sort="time",default_fc_parameters=MinimalFCParameters())

    features = extracted_features.dropna(axis=1, how="any")

    selected = select_features(features, my_y.values, ml_task="regression", fdr_level=0.1)

    finaldata = selected
    finaldata["y"] = my_y.values
    finaldata["cat"] = my_cat.values

    if train:

        finaldata.to_csv(path_or_buf="train_data_ts.csv", header=list(finaldata.columns), index=True)

        with open("data_ts_desc.txt", "w") as file:
            file.write("train_data_ts.csv")
            file.write("\nNA")
            file.write("\n2")
            file.write("\n1 index x")
            for count, i in enumerate(list(finaldata.columns)[:-2]):
                file.write("\n" + str(count + 2) + " " + str(i) + " n")
            file.write("\n" + str(finaldata.shape[1]) + " y d")
            file.write("\n" + str(finaldata.shape[1] + 1) + " cat b")

    else:

        finaldata.to_csv(path_or_buf="test_data_ts.csv",header=list(finaldata.columns), index=True )


