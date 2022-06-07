import pandas as pd
import numpy as np


def create_dataset(ts_size, filename, train=True):
    data = pd.read_csv(filename, header=None)
    all_data = matlab_to_data(data=data, ts_size=ts_size)

    if train:
        all_data.to_csv(path_or_buf="train_data.csv", header=list(all_data.columns), index=True)
        with open("data_desc.txt", "w") as file:
            file.write("train_data.csv")
            file.write("\nNA")
            file.write("\n2")
            file.write("\n1 index x")
            for count, i in enumerate(list(all_data.columns)[:-1]):
                file.write("\n" + str(count + 2) + " " + str(i) + " n")
            index = str(len(list(all_data.columns)) + 1)
            file.write("\n" + index + " " + str(all_data.columns[-1]) + " d")
            # file.write("\n" + "22 cat" + " b")
    else:
        all_data.to_csv(path_or_buf="test_data.csv", header=list(all_data.columns), index=True)


def matlab_to_data(data, ts_size):
    data_size = int(data.size / len(data))
    values = data.iloc[:, 0:ts_size].values
    new_np = values.reshape((1, 2 * ts_size))
    for i in range(1, data_size - ts_size):
        u_y = data.iloc[:, i:i + ts_size].values
        u_y = u_y.reshape((1, 2 * ts_size))
        new_np = np.vstack((new_np, u_y))

    names = ["u_" + str(i) for i in range(ts_size)] + ["y_" + str(i) for i in range(ts_size)]
    new_data = pd.DataFrame(new_np, columns=names)

    column_to_drop = "u_" + str(ts_size-1)
    new_data = new_data.drop([column_to_drop], axis=1)

    return new_data
