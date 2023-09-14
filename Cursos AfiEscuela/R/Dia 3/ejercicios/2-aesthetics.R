# Incluimos el paquete
library(ggplot2)

# Estudiemos el set de datos
str(diamonds)
head(diamonds)

# AESTHETICS DE POSICIÓN
# ----------------------

# Variables continuas
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point()

# Scatter plot de una variable continua vs discreta 


# Variables discretas: Scatter plot de dos variables discretas


# AESTHETICS DE TRANSPARENCIA
# --------------------------

# Transparencia como aesthetic
ggplot(diamonds, aes(x = carat, y = price, alpha=clarity)) +
  geom_point()

# Transparencia como attribute: dar un valor concreto a alpha (entre 0 y 1)



# AESTHETICS DE COLOR
# -------------------

# Color como aesthetic (continuo)
ggplot(diamonds, aes(x = price, y = x * y * z, col = carat)) + 
  geom_point()

# Color como aesthetic (discreto)


# Color como atributo



# Listado de colores disponibles por nombre en R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# Relleno como aesthetic


# Relleno como atributte



# AESTHETICS DE FORMA
# -------------------

# Forma como aesthetic (continua)
ggplot(diamonds, aes(x = carat, y = price, shape=x * y *z)) + 
  geom_point()

# Forma como aesthetic (discreta)
ggplot(diamonds, aes(x = carat, y = price, shape=cut)) + 
  geom_point()

# Forma como attribute (discreta)
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point(shape=1)

# Listado de formas disponibles en R: http://www.cookbook-r.com/Graphs/Shapes_and_line_types/

# Tipo de linea como aesthetic (continua)
ggplot(diamonds, aes(x = carat, y = price, linetype=x * y * z)) + 
  geom_smooth(se=F, size=1)

# Tipo de linea como aesthetic (discreta)
ggplot(diamonds, aes(x = carat, y = price, linetype=cut, col=cut)) + 
  geom_smooth(se=F, size=1)

# Tipo de linea como attribute
ggplot(diamonds, aes(x = carat, y = price, col = cut)) + 
  geom_smooth(se=F, size=1, linetype="dotdash")

# Listado de tipos de linea disponibles en R: http://www.cookbook-r.com/Graphs/Shapes_and_line_types/



# AESTHETICS DE TAMAÑO: size
# --------------------

# Tamaño como aesthetic (continua)

# Tamaño como aesthetic (discreta)


# Tamaño como attirbute




