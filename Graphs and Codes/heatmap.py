import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd

def heatmap(csv_path):
    df = pd.read_csv(csv_path)
    df = df.pivot(index='x', columns='y', values='z')
    sns.heatmap(df)

    plt.show()