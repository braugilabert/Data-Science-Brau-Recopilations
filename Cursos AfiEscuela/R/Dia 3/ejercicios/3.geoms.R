# Incluimos el paquete
library(ggplot2)

# Estudiemos el set de datos
str(iris)
head(iris)

# Una variable continua
# ---------------------
gg <- ggplot(iris, aes(x = Petal.Length))

# Histograma


# Barras


# Densidad



# OVERPLOTTING EN SCATTER PLOTS
# -----------------------------

# Un ejemplo de overplotting
gg <- ggplot(mtcars, aes(x = as.factor(cyl), y = as.factor(am), col = as.factor(gear)))
gg + 
  geom_point(size = 3)

# Con geom_jitter lo solucionamos
gg +
  geom_jitter(size = 3)

# geom_jitter es un alias para
gg + 
  geom_point(size = 3, position = "jitter")

# Perdemos "la pista" de de dónde vienen los puntos. Sería necesario tener menos ruido

# Establecemos los parámetros de la función de posición
gg + 
  geom_point(size = 2, position = position_jitter(width = 0.5, height = 0.5))


# Dos variables continuas
# -----------------------
 gg <- 
  
  
# Scatter plot

# Scatter con ruido

# Linea




# Una variable discreta y una continua
# ------------------------------------


# Barras


# Scatter

# Scatter con ruido (barras con distribución)


# Boxplot

# Violin


################################### POSITIONS
# Analizamos el set de datos
str(mtcars)
head(mtcars)

# POSICIONAMIENTO DE GRÁFICOS DE BARRAS
# -------------------------------------

# Generamos un gráfico de barras  a partir de la variable gg
gg <- ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(am)))



# Posicionamiento "uno al lado del otro"


# Modificamos el posicionamiento en X para que haya solapamiento



# Posicionamiento "uno encima del otro"

# Posicionamiento "uno encima del otro normalizado"
gg + 
  geom_bar(position = "fill")


