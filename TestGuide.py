import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def plot_prediction(model, error, ts_fresh = False):
    if ts_fresh:

        # for right index
        o_data = pd.read_csv("test_data.csv", index_col=0, sep=",")
        ind = o_data.index

        pred = pd.read_csv("predictions.csv", sep=" ", header=None)
        pred = pred.transpose()
        # predictions = pred.values

        data = pd.read_csv("test_data_ts.csv", sep=",")
        data.index = ind
        targets = data["y"]
        # predictions = predictions.reshape(targets.shape)

        compare = pd.DataFrame(targets)
        compare["y_dach"] = pred.values
        compare = compare.sort_index()

        fig, axs = plt.subplots(1, figsize=(10, 2))
        fig.suptitle('Predicting y_dach with TSFresh and ' + model + " - RMSE = " + str(error))
        axs.plot(compare.y, label="y")
        axs.plot(compare.y_dach, label="y_dach")
        axs.legend()
    else:
        pred = pd.read_csv("predictions.csv", sep=" ", header=None)
        pred = pred.transpose()
        pred.columns = ["y_dach"]

        data = pd.read_csv("test_data.csv", index_col=0, sep=",")
        data = data[["y_9", "cat"]]

        compare = data
        compare["y_dach"] = pred.values
        compare = compare.sort_index()

        h_compare = compare[compare["cat"] == "hammerstein"]
        w_compare = compare[compare["cat"] == "wiener"]
        n_compare = compare[compare["cat"] == "nde"]

        fig, axs = plt.subplots(4, figsize=(10, 8))
        fig.suptitle('Predicting y_dach with ' + model + " - RMSE = " + str(error))

        axs[0].plot(compare.y_9, label="y")
        axs[0].plot(compare.y_dach, label="y_dach")
        e = rmse(compare.y_dach.values, compare.y_9.values)
        axs[0].set_title("All Data - RMSE = " + str(e))
        axs[0].legend()

        axs[1].plot(h_compare.y_9, label="y")
        axs[1].plot(h_compare.y_dach, label="y_dach")
        e_h = rmse(h_compare.y_dach.values, h_compare.y_9.values)
        axs[1].set_title("Hammerstein - RMSE = " + str(e_h))
        axs[1].legend()

        axs[2].plot(w_compare.y_9, label="y")
        axs[2].plot(w_compare.y_dach, label="y_dach")
        e_w = rmse(w_compare.y_dach.values, w_compare.y_9.values)
        axs[2].set_title("Wiener - RMSE = " + str(e_w))
        axs[2].legend()

        axs[3].plot(n_compare.y_9, label="y")
        axs[3].plot(n_compare.y_dach, label="y_dach")
        e_n = rmse(n_compare.y_dach.values, n_compare.y_9.values)
        axs[3].set_title("NDE - RMSE = " + str(e_n))
        axs[3].legend()
        fig.tight_layout()



def rmse(predictions, targets):
    return np.sqrt(((predictions - targets) ** 2).mean())

def error(test_data):
    pred = pd.read_csv("predictions.csv", sep=" ", header=None)
    pred = pred.transpose()
    predictions = pred.values

    data = pd.read_csv(test_data, sep=",")

    try:
        targets = data.y.values
    except:
        targets = data.y_9.values

    predictions = predictions.reshape(targets.shape)
    return rmse(targets, predictions)
