# Incluimos el paquete
library(ggplot2)

# Estudiemos el set de datos
str(diamonds)
head(diamonds)


# ESCALAS DE PROPÓSITO GENERAL
# ----------------------------

# Modificación de escala sobre variable continua
gg.cont <- ggplot(diamonds, aes(x = x * y * z, y = price)) + 
  geom_point()
gg.cont

gg.cont + 
  scale_x_continuous(name = "size",
                     limits = c(0, 800),
                     breaks = seq(0, 800, 200),
                     minor_breaks = seq(0, 800, 100))


# Modificación de escala sobre variable discreta: modifica la variable discreta, según 4 niveles
# "I1", "SI2", "VVS2" y "IF", con las etiquetas "Bad", "Normal", "Good" y "Ideal", respectivamente. 
#Limita la variable "y" entre 1000 y 2000.

gg.disc <- ggplot(diamonds, aes(x = clarity, y = price)) + 
  geom_jitter()
gg.disc

