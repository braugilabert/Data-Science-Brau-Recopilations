import pandas as pd
import matplotlib.pyplot as plt

def stacked_column_chart(csv_path):
    df = pd.read_csv(csv_path)
    ax = df.plot(kind='bar', stacked=True)

    ax.set_ylabel('Scores')
    ax.set_title('Scores by group')

    plt.show()