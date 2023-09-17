import pandas as pd
import matplotlib.pyplot as plt

def bubble_plot(csv_path):
    df = pd.read_csv(csv_path)
    df.plot(kind='scatter', x='x', y='y', s=df['size']*10)

    plt.show()