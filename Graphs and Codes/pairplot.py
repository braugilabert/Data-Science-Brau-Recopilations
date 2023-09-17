import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

def pairplot(csv_path):
    df = pd.read_csv(csv_path)
    sns.pairplot(df)

    plt.show()
