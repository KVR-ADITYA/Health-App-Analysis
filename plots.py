import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("./indexx.csv")

df1 = df.drop([])

ax = plt.plot(df["Clusters"],df["Dunns"], color = 'red', label = "Dunns")
plt.plot( df["Clusters"], df["Davies-Bouldin"],ax=ax ,color = 'blue', label = "Davies-Bouldin")

df.plot()
plt.show()