import seaborn as sns
import matplotlib.pyplot as plt

def target_correlations(df, target):
    corr = df.corr()[target].sort_values(ascending=False)
    sns.barplot(x=corr.index, y=corr)

    plt.show()
