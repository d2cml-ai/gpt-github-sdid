import pandas as pd
import numpy as np

data = pd.read_csv("build/output/pushes_clean.csv")

collapsed_data = data[data["gpt_available"] == 0]

collapsed_treated = data[data["gpt_available"] == 1].groupby("year_quarter_num", as_index=False).mean()

collapsed_treated["iso2_code"] = "Treated"

collapsed_data = pd.concat([collapsed_data, collapsed_treated])

collapsed_data.to_csv("build/output/pushes_collapsed.csv", index=False)