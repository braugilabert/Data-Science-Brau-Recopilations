import pandas as pd
import matplotlib.pyplot as plt

def line_chart(csv_path):
    df = pd.read_csv(csv_path)
    df.plot(kind='line')

    plt.show()
