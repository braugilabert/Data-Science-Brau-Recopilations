import matplotlib.pyplot as plt
import pandas as pd

def boxplot(csv_path):
    df = pd.read_csv(csv_path)
    df.boxplot(column=['column1', 'column2', 'column3'])

    plt.show()
