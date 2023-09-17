import pandas as pd
import matplotlib.pyplot as plt

def scatter_plot(csv_path):
    df = pd.read_csv(csv_path)
    df.plot(kind='scatter', x='x', y='y')

    plt.show()