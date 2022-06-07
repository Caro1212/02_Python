
from multiprocessing import freeze_support
from Guide_ausführen import run_guide
import pandas as pd
from ts_fresh import get_tsfresh_data

from datetime import datetime, timedelta

if __name__ == '__main__':
    freeze_support()

    data_must_be_created = True
    input_must_be_created = False
    ts_fresh_for_data = True

    if data_must_be_created:

        import ReadVitalData
        import ReadDrugsData
        from PreprocessingData import get_final_klient_data, get_train_data, get_guide_data

        vital = ReadVitalData.vital
        mydi = ReadDrugsData.di
        klients = ReadVitalData.klients

        n = 7
        df = get_final_klient_data(97, klients, vital, mydi)
        spalten = [x for x in df.columns if x.startswith("Insulin") or x.startswith("Metformin") or
                   x.startswith("Sitagliptin") or
                    x in ["blutzucker","bmi", "gewicht", "sys", "dia"]]
        df = df[spalten]

        x, y = get_train_data(df, n, m='max')

        if ts_fresh_for_data:
            z = get_tsfresh_data(x,y)
            z["y"] = y

            z.columns = [x.replace(",", "_") for x in z.columns]
            z.columns = [x.replace(" ", "_") for x in z.columns]

            z.to_csv(path_or_buf="train_data.csv", header=list(z.columns),index=False, na_rep = "NA")

            with open("data_desc.txt", "w") as file:
                file.write("train_data.csv")
                file.write("\nNA")
                file.write("\n2")

                for count, col in enumerate(list(z.columns)[:-1]):
                    if col.startswith("blutzucker"):
                        role = " f"  # fitted, aber splittet nicht
                    else:
                        role = " n"
                    file.write("\n" + str(count + 1) + " " + col + role)  # alle variablen dürfen splitten und regressor sein
                file.write("\n" + str(len(list(z.columns))) + " y d")


        else:
            guide_data = get_guide_data(x, y, n)
            guide_data.columns = [x.replace(",", "_") for x in guide_data.columns]
            guide_data.columns = [x.replace(" ", "_") for x in guide_data.columns]

            guide_data.to_csv(path_or_buf="train_data.csv", header=list(guide_data.columns), index=False, na_rep = "NA")
            with open("data_desc.txt", "w") as file:
                file.write("train_data.csv")
                file.write("\nNA")
                file.write("\n2")
                for count, col in enumerate(list(guide_data.columns)[:-1]):
                    if col.startswith("blutzucker"):
                        role = " f" #fitted, aber splittet nicht
                    else:
                        role = " n"
                    file.write("\n" + str(count + 1) + " " + col + role)  # alle variablen dürfen splitten und regressor sein
                file.write("\n" + str(len(list(guide_data.columns))) + " y d")

    if input_must_be_created:
        import CreateInputfile

    input_file = "Input.txt"
    output_file = "Output.txt"
    r_file = "predict.r"
    train_data = "train_data.csv"
    test_data = "train_data.csv"
    latex_file_name = "tree"
    model = "multiple"  #must be one of constant, simple or multiple

    run_guide(input_file, r_file, train_data, test_data, latex_file_name)


