import matplotlib.pyplot as plt
from multiprocessing import freeze_support
from Guide_ausführen import run_guide
from ts_fresh import ts_extracting
from TestGuide import plot_prediction
from TestGuide import error
from TestGuide import complexity
from Qualitative_DataPreparing import create_dataset


matlab_data_exist = True
data_has_to_be_converted = False
if matlab_data_exist and data_has_to_be_converted:
    create_dataset(2, "matlab_wiener_quali.csv", train=True)
    create_dataset(2, "matlab_wiener_quali.csv", train=False)


new_input = False
if new_input:
    import CreateInputfile

input_file = "Input.txt"
output_file = "Output.txt"
r_file = "predict.r"
train_data = "train_data.csv"
test_data = "test_data.csv"
latex_file_name = "tree"
model = "Multiple Linear Model"

#run_guide(input_file, r_file, train_data, test_data, latex_file_name)

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

pred = pd.read_csv("predictions.csv", sep=" ", header=None)
pred = pred.transpose()
pred.columns = ["y_dach"]
z = pred.y_dach

data = pd.read_csv("test_data.csv", index_col=0, sep=",")
x = data.u_0
y = data.y_0
# create 2d x,y grid (both X and Y will be 2d)
X, Y = np.meshgrid(x, y)

# repeat Z to make it a 2d grid
Z = np.tile(z, (len(z), 1))

fig = plt.figure(figsize=(20,16))

ax = fig.add_subplot(111, projection='3d')

ax.plot_surface(X, Y, Z, cmap='ocean')

# rotate the axes and update
#ax.view_init(30, 90)
plt.show()
