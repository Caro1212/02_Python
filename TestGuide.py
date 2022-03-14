import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


def plot_prediction(model, ts_fresh=False):

    pred = pd.read_csv("predictions.csv", sep=" ", header=None)
    pred = pred.transpose()
    pred.columns = ["y_dach"]

    if ts_fresh:
        data = pd.read_csv("test_data_ts.csv", index_col=0, sep=",")
    else:
        data = pd.read_csv("test_data.csv", index_col=0, sep=",")
    data = data.iloc[:, -1]
    compare = pd.DataFrame(data=data)
    compare["y_dach"] = pred.values
    compare.columns = ["y", "y_dach"]

    fig, axs = plt.subplots(1, figsize=(10, 8))

    if ts_fresh:
        fig.suptitle('Predicting y_dach with ' + model + " and TsFresh")
    else:
        fig.suptitle('Predicting y_dach with ' + model + " and End-to-End")

    axs.plot(compare.y, label="y")
    axs.plot(compare.y_dach, label="y_dach")
    e = rmse(compare.y_dach.values, compare.y.values)
    axs.set_title("All Data - RMSE = " + str(e))
    axs.legend()

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
        targets = data.y_1.values

    predictions = predictions.reshape(targets.shape)
    return rmse(targets, predictions)


def complexity(output_file, train_data, model):
    with open(output_file, "r") as file:
        for position, line in enumerate(file):
            if "Total number of nodes of final tree" in line:
                total = line
            elif "Number of terminal nodes of final tree" in line:
                final = line
            elif "******" in line:
                begin = position+3

    with open(output_file, "r") as file:
        lines = file.readlines()
    lines = lines[begin::]
    index = len("Total number of nodes of final tree: ")
    number_of_nodes = int(total[index:-1])
    index = len("Number of terminal nodes of final tree: ")
    number_of_final = int(final[index:-1])

    if model == "constant":
        complexity1 = 1*number_of_final + (number_of_nodes - number_of_final)
    elif model == "simple":
        complexity1 = 2*number_of_final + (number_of_nodes - number_of_final)
    elif model == "multiple":
        if number_of_nodes == 1:
            with open(train_data, "r") as file:
                line = file.readline()
            line = line[1:-1]
            variables = line.split(",")
            mylist = [x for x in lines for i in variables if x.startswith(" " + i)]
            complexity1 = len(mylist)
        else:
            output = lines
            div = ' ----------------------------\n'
            g = [i for i, e in enumerate(output) if e == div]
            list_of_nodes = []
            list_of_nodes.append(output[0:g[0] + 1])
            for index, nodes_start in enumerate(g[:-1]):
                list_of_nodes.append(output[nodes_start + 1:g[index + 1] + 1])
            list_of_nodes = list_of_nodes[1::]
            for nodelist in list_of_nodes:
                if nodelist[0].endswith("Intermediate node\n"):
                    list_of_nodes.remove(nodelist)
            # len(list_of_nodes) == final
            complexity2 = sum(list(map(lambda x: len(x) - 6, list_of_nodes)))
            complexity1 = complexity2 + (number_of_nodes - number_of_final)

    return complexity1
