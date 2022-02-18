import pandas as pd
import numpy as np

ts_size = 10
system = "hammerstein"
data = pd.read_csv("matlab_hammerstein.csv", header=None)


def matlab_to_data(data, system, ts_size, filename="raw_data.csv", write_csv=False):
    data_size = int(data.size / len(data))
    values = data.iloc[:, 0:ts_size].values
    new_np = values.reshape((1, 2 * ts_size))
    for i in range(1, data_size - ts_size):
        u_y = data.iloc[:, i:i + ts_size].values
        u_y = u_y.reshape((1, 2 * ts_size))
        new_np = np.vstack((new_np, u_y))

    names = ["u_" + str(i) for i in range(ts_size)] + ["y_" + str(i) for i in range(ts_size)]
    new_data = pd.DataFrame(new_np, columns=names)
    new_data["cat"] = system

    if write_csv:
        new_data.to_csv(path_or_buf=filename, header=new_data.columns, index=False)
    return new_data
