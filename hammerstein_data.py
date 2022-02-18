import numpy as np
import matplotlib.pyplot as plt
import os

path = 'C:/Users/Caroline Kries/Desktop/GUIDE/'
os.chdir(path)

def u(t):
    return t + np.random.normal(0,0.2,1)

timestamps_A = np.arange(-5,5)
timestamps_B = np.arange(0,10)
timestamps_C = np.arange(-2,8)

def y(t,z):
    return 1*np.sin(0.5*u(t-1))+ 0.3*z

data_size = 90
data = np.zeros((data_size, len(timestamps_A)+1))
for i in range(int(data_size / 3)):
    values = np.array([])
    z=1
    for t in timestamps_A:
        z = y(t,z)
        values = np.append(values, z)
    values = np.transpose(np.array(values))
    data[i] = np.hstack((values, 1))
for i in range(int(data_size / 3) +1, int(2*data_size/3)):
    values = np.array([])
    z=1
    for t in timestamps_B:
        z = y(t, z)
        values = np.append(values, z)
    values = np.transpose(np.array(values))
    data[i] = np.hstack((values, -1))
for i in range(int(2*data_size / 3) +1, data_size):
    values = np.array([])
    z=1
    for t in timestamps_C:
        z = y(t, z)
        values = np.append(values, z)
    values = np.transpose(np.array(values))
    data[i] = np.hstack((values, -1))


np.savetxt("hammerstein_data.txt", data)

with open("hammerstein_desc.txt", "w") as file:
    file.write("hammerstein_data.txt")
    file.write("\nNA")
    file.write("\n1")
    for i in range(len(timestamps_A) - 1):
        file.write("\n"+str(i+1)+" t_"+str(i+1)+" n")
    file.write("\n"+str(len(timestamps_A))+ " t_"+str(len(timestamps_A))+" d")
    file.write("\n"+"11"+" kat"+" c")