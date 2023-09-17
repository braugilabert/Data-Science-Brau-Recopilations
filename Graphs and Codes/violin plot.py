import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

def violin_plot(csv_path):
    df = pd.read_csv(csv_path)
    sns.violinplot(data=df)

    plt.show()