import matplotlib.pyplot as plt
from multiprocessing import freeze_support
from Guide_ausführen import run_guide
from ts_fresh import ts_extracting
from TestGuide import plot_prediction
from TestGuide import error
from TestGuide import complexity
from Qualitative_DataPreparing import create_dataset
import pandas as pd
import numpy as np
from plotting import quali_plot

matlab_data_exist = True
train_names = "matlab_train.csv"
test_names = "matlab_test.csv"
data_has_to_be_converted = True
if matlab_data_exist and data_has_to_be_converted:
    create_dataset(ts_size=2, filename=train_names, train=True)
    create_dataset(ts_size=2, filename=test_names, train=False)

new_input = False
if new_input:
    import CreateInputfile

input_file = "Input.txt"
output_file = "Output.txt"
r_file = "predict.r"
train_data = "train_data.csv"
test_data = "test_data.csv"
latex_file_name = "tree"
model = "multiple"

run_guide(input_file, r_file, train_data, test_data, latex_file_name)

quali_plot()

