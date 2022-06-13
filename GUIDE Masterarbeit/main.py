
from multiprocessing import freeze_support
from Guide_ausführen import run_guide
import pandas as pd
from ts_fresh import get_tsfresh_data
from Evaluation import complexity
from functools import partial
from datetime import datetime, timedelta

if __name__ == '__main__':
    freeze_support()

    data_must_be_created = True
    input_must_be_created = False
    ts_fresh_for_data = False

    def create_and_evaluate(klient, n, ts_fresh_for_data, sampling_frequency, data_must_be_created=True, input_must_be_created=False):

        if data_must_be_created:

            import ReadVitalData
            import ReadDrugsData
            from PreprocessingData import get_final_klient_data, get_train_data, get_guide_data

            vital = ReadVitalData.vital
            mydi = ReadDrugsData.di
            klients = ReadVitalData.klients


            df = get_final_klient_data(klient, klients, vital, mydi, sampling_frequency)

            spalten = [x for x in df.columns if x.startswith("Insulin") or x.startswith("Metformin") or
                       x.startswith("Sitagliptin") or
                        x in ["blutzucker", "gewicht", "sys"]]
            df = df[spalten]

            x, y = get_train_data(df, n, sampling_frequency=sampling_frequency, m='max')

            if ts_fresh_for_data:
                z = get_tsfresh_data(x,y)
                z["y"] = y

                z.columns = [x.replace(",", "_") for x in z.columns]
                z.columns = [x.replace(" ", "_") for x in z.columns]

                if len(z.columns) < 2:
                    return

                z.to_csv(path_or_buf="train_data.csv", header=list(z.columns),index=False, na_rep = "NA")

                with open("data_desc.txt", "w") as file:
                    file.write("train_data.csv")
                    file.write("\nNA")
                    file.write("\n2")

                    for count, col in enumerate(list(z.columns)[:-1]):
                        if col.startswith("blutzucker"):
                            role = " n"  # fitted, aber splittet nicht
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
                            role = " n" #fitted, aber splittet nicht
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

        number_of_final = complexity(output_file)
        print(number_of_final)

        return number_of_final



    klientenliste = [180,175,161,157,156,149,147,138, 126,118,97,90,70,69,60,39,25,18,13,12,8]
    df = pd.DataFrame(index=klientenliste)

    for ts_fresh_for_data in [True, False]:
        for n in [1,5,10,20]:
            results = list(map(partial(create_and_evaluate, n=n,
                                       ts_fresh_for_data=ts_fresh_for_data,
                                       sampling_frequency = '1w'), klientenliste))

            if ts_fresh_for_data is True:
                cname = str(n)+"_weeks_tsfresh"
            else:
                cname = str(n)+"_weeks_end2end"

            df[cname] = results

    for n in [5,30,50,100]:
        results = list(map(partial(create_and_evaluate, n=n,
                                   ts_fresh_for_data = True,
                                   sampling_frequency = '1d'), klientenliste))

        cname = str(n)+"_days_tsfresh"
        df[cname] = results


    df.to_csv("results.csv")



    #results = map(create_and_evaluate, [175,161,157,156,149,147,138, 126,118,97,90,70,69,60,39,25,18,13,12,8])
    #print(list(results))
    #create_and_evaluate(25)

