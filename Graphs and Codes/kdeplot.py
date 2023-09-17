import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

def kdeplot(csv_path):
    df = pd.read_csv(csv_path)
    sns.kdeplot(data=df)

    plt.show()
