import matplotlib.pyplot as plt
from multiprocessing import freeze_support
from Guide_ausführen import run_guide
from ts_fresh import ts_extracting
from TestGuide import plot_prediction
from TestGuide import error
from TestGuide import complexity
from DataPreparing import create_dataset



if __name__ == '__main__':
    freeze_support()


    matlab_data_exist = True
    train_names = ["matlab_hammerstein.csv", "matlab_wiener.csv", "matlab_nde.csv"]
    test_names = ["matlab_hammerstein_test.csv", "matlab_wiener_test.csv", "matlab_nde.csv"]
    data_has_to_be_converted = False
    if matlab_data_exist and data_has_to_be_converted:
        create_dataset(ts_size=10, filenames=train_names,train=True)
        create_dataset(ts_size=10, filenames=test_names, train=False)


    ts_fresh = False
    ts_fresh_has_to_be_created = False
    if ts_fresh and ts_fresh_has_to_be_created:
        ts_extracting(datafile="train_data.csv", train=True)
        ts_extracting(datafile ="test_data.csv", train=False)

    new_input = True
    if new_input:
        import CreateInputfile

    input_file = "Input.txt"
    output_file = "Output.txt"
    r_file = "predict.r"
    train_data = "train_data.csv"
    test_data = "test_data.csv"
    latex_file_name = "tree"
    model = "Constant Model"

    run_guide(input_file, r_file, train_data, test_data, latex_file_name)

    e = error(test_data)
    plot_prediction(model, e, ts_fresh=ts_fresh)
    plt.show()

    nodes,parameters = complexity(output_file, train_data)
    print("Anzahl an Knoten : %2d, Anzahl an Parametern : %2d" % (nodes, parameters))

