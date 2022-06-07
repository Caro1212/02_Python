import os
import pandas as pd
from tsfresh import extract_relevant_features
from multiprocessing import freeze_support
from tsfresh import extract_features
from tsfresh import select_features
from tsfresh.utilities.dataframe_functions import impute
from tsfresh.feature_extraction.settings import MinimalFCParameters


def get_tsfresh_data(x,y):
    x["time"] = x.index
    extracted_features = extract_features(x,
                                          column_id="timeseries_id",
                                          column_sort="time",
                                          default_fc_parameters=MinimalFCParameters())

    features = extracted_features.dropna(axis=1, how="any")
    selected = select_features(features, y, ml_task="regression", fdr_level=0.05)

    return selected
