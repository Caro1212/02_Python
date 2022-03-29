import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

def quali_plot():
    pred = pd.read_csv("predictions.csv", sep=" ", header=None)
    pred = pred.transpose()
    pred.columns = ["y_dach"]
    z = pred.y_dach

    data = pd.read_csv("test_data.csv", index_col=0, sep=",")
    x = data.u_0
    y = data.y_0
    z = data.y_1
    # create 2d x,y grid (both X and Y will be 2d)
    X, Y = np.meshgrid(x, y)

    # repeat Z to make it a 2d grid
    Z = np.tile(z, (len(z), 1))

    fig = plt.figure(figsize=(8, 6))
    ax = fig.add_subplot(111, projection='3d')
    # surf = ax.plot_surface(X, Y, Z, cmap='rainbow')
    ax.scatter(x, y, z)
    # rotate the axes and update
    # ax.view_init(30, 100)
    ax.set_xlabel("u(t-1)")
    ax.set_ylabel("y(t-1)")
    ax.set_zlabel("y(t)")
    # fig.colorbar(surf, shrink=0.5, aspect=5)
    plt.show()
