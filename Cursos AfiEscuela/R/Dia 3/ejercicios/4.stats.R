# Incluimos el paquete
library(ggplot2)

# SUAVIZADO / REGRESIÓN
# ---------------------

# Volvamos a un ejemplo básico
ggplot(iris, aes(x = Sepal.Length, 
                 y = Sepal.Width, 
                 col = Species)) + 
  geom_point()

# Añadimos un suavizado mediante el uso del stat_smooth


# Pintamos únicamente el stat


# Modificamos el geom del stat: geom = 'line'



# Modificamos los aesthetics del stat: fill = Species y un valor para alpha.

















