from wordcloud import WordCloud
import matplotlib.pyplot as plt

def wordcloud(text):
    wc = WordCloud(background_color='white', max_words=2000, contour_width=3, contour_color='steelblue')
    wc.generate(text)

    plt.imshow(wc, interpolation='bilinear')
    plt.axis('off')
    plt.show()