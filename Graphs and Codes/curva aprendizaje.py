from sklearn.model_selection import learning_curve
import matplotlib.pyplot as plt

def learning_curve(model, X, y):
    train_sizes, train_scores, test_scores = learning_curve(model, X, y)

    plt.plot(train_sizes, train_scores.mean(axis=1), label='Training score')
    plt.plot(train_sizes, test_scores.mean(axis=1), label='Cross-validation score')
    plt.xlabel('Training set size')
    plt.ylabel('Score')
    plt.legend()

    plt.show()
