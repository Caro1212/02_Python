'''
Gegeben ist eine classin.txt Datei, konfiguriert durch das Ausführen von guide.
guide < classin.txt produziert eine R-Datei zum Predicten. In dieser R-Datei muss der Test-Datensatz in Zeile 77 angegeben werden.
Das Ausführen der R-Datei mittels RStudio schreibt eine csv-Datei mit den predicteten Werten.
'''

import os
import pandas as pd
# Import necessary packages
import rpy2.robjects as robjects
from rpy2.robjects.packages import importr
from rpy2.robjects import pandas2ri
# Must be activated
# pandas2ri.activate()
# Import the SignatureTranslatedAnonymousPackage
from rpy2.robjects.packages import STAP
import subprocess

input_file = "Input_sl.txt"
r_file = "predict.r"
train_data = "data.csv"
test_data = "data.csv"
latex_file_name = "tree"

path = 'C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/04_Quellcode/02_Python/GUIDE Masterarbeit'
os.chdir(path)


def run_guide(input_file, r_file, train_data, test_data, latex_file_name):

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Run guide < input_file
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    cmd = "guide < " + input_file
    os.system(cmd)



    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Remove old Latex files for creating new ones
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    # files = [latex_file_name + x for x in [".tex", ".aux", ".dvi", ".ps", ".pdf", ".txt"]]
    # for f in files:
    #     try:
    #         os.remove(f)
    #     except:
    #         pass
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
     Draw the tree in a pdf file latex_file_name.pdf
     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    os.system("latex " + latex_file_name)
    os.system("dvips " + latex_file_name)
    os.system("ps2pdf " + latex_file_name + ".ps")
    #
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Adapt r file
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    # with open(r_file, "r") as f:
    #     lines = f.readlines()
    # with open(r_file, "w") as f:
    #     for line in lines:
    #         if line.strip() != "pred <- rbind(pred,as.numeric(tmp[-c(1,2)]))":
    #             f.write(line)
    #
    datei = open(r_file, 'a')
    datei.write("\ncat(pred)")
    datei.close()

    if train_data != test_data:
        with open(r_file, "r") as file:
            x = file.read()
        with open(r_file, "w") as file:
            x = x.replace(train_data, test_data)
            #x = x.replace("_(human)_","")
            #x = x.replace("-1-","")
            #x = x.replace("lispro-Isophan","lispro_Isophan")
            file.write(x)

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Predict new data
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    r_path = 'C:/Users/Caroline Kries/sciebo/Forschungsprojekt Medikamenteninteraktion/04_Quellcode/02_Python/GUIDE Masterarbeit/' + r_file
    command = 'Rscript'
    cmd = [command, 'pred.r']
    x = subprocess.check_output(cmd, universal_newlines=True)
    with open("predictions.csv", "w") as f:
        f.write(x)


    #
    # '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    # Draw the tree in a pdf file latex_file_name.pdf
    # '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    #
    # os.system("latex " + latex_file_name)
    # os.system("dvips " + latex_file_name)
    # os.system("ps2pdf " + latex_file_name + ".ps")
