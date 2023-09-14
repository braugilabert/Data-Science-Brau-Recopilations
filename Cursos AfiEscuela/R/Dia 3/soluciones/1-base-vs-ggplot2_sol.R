# Incluimos la libreria
library(ggplot2)

# Resumen del contenido del set de datos
str(iris)

# Base: Scatter plot de Longitud vs. Anchura en sépalos
plot(iris$Sepal.Length, iris$Sepal.Width)

# ggplot2: Scatter plot de Longitud vs. Anchura en sépalos
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point()

# Base: Scatter plot de Longitud vs. Anchura en sépalos Y pétalos - MAL
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Petal.Length, iris$Petal.Width)

# Base: Añadir Longitud vs. Anchura de pétalos - REGULAR
plot(iris$Sepal.Length, iris$Sepal.Width)
points(iris$Petal.Length, iris$Petal.Width)

# Base: Añadir Longitud vs. Anchura de pétalos -  BIEN
plot(iris$Sepal.Length, iris$Sepal.Width)
points(iris$Petal.Length, iris$Petal.Width, col='red')

# ggplot2: Scatter plot de Longitud vs. Anchura en sépalos Y pétalos - REGULAR
ggplot(iris, aes(x=Sepal.Length, y = Sepal.Width)) + 
  geom_point() + 
  geom_point(aes(x=Petal.Length, y = Petal.Width), col = 'red')


# ggplot2: Scatter plot de Longitud vs. Anchura en sépalos Y pétalos - BIEN
ggplot(iris) + 
  geom_point(aes(x=Sepal.Length, y = Sepal.Width)) + 
  geom_point(aes(x=Petal.Length, y = Petal.Width), col = 'red')

