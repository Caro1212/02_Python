import pandas as pd
import numpy as np
from matlab_import import matlab_to_data
from sklearn.model_selection import train_test_split


def matlab_to_data(data, ts_size=1, filename="raw_data.csv", write_csv=False):
    data_size = int(data.size / len(data))
    values = data.iloc[:, 0:ts_size].values
    new_np = values.reshape((1, 2 * ts_size))
    for i in range(1, data_size - ts_size):
        u_y = data.iloc[:, i:i + ts_size].values
        u_y = u_y.reshape((1, 2 * ts_size))
        new_np = np.vstack((new_np, u_y))

    names = ["u_" + str(i) for i in range(ts_size)] + ["y_" + str(i) for i in range(ts_size)]
    new_data = pd.DataFrame(new_np, columns=names)


    new_data = new_data.drop(["u_1"], axis=1)

    if write_csv:
        new_data.to_csv(path_or_buf=filename, header=new_data.columns, index=False)
    return new_data


def create_dataset(ts_size, filename, train=True):
    data = pd.read_csv(filename, header=None)
    my_data = matlab_to_data(data, ts_size, filename, write_csv=False)

    if train:
        my_data.to_csv(path_or_buf="train_data.csv", header=list(my_data.columns), index=True)
        with open("data_desc.txt", "w") as file:
            file.write("train_data.csv")
            file.write("\nNA")
            file.write("\n2")
            file.write("\n1 index x")
            for count, i in enumerate(list(my_data.columns)[:-1]):
                file.write("\n" + str(count + 2) + " " + str(i) + " n")
            file.write("\n" + "4 " + str(my_data.columns[-1]) + " d")

    else:
        my_data.to_csv(path_or_buf="test_data.csv", header=list(my_data.columns), index=True)


#create_dataset(2, "matlab_wiener.csv", train=True)
