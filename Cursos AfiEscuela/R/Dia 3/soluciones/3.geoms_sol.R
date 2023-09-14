# Incluimos el paquete
library(ggplot2)

# Estudiemos el set de datos
str(iris)
head(iris)

# Una variable continua
# ---------------------
gg <- ggplot(iris, aes(x = Petal.Length))

# Área
gg + 
  geom_area(stat = "bin", bins = 10)

# Histograma
gg + 
  geom_histogram(binwidth=1)

# Barras
gg + 
  geom_bar(binwidth=1)

# Densidad
gg + 
  geom_density()

# Histograma de puntos
gg + 
  geom_dotplot()


# Dos variables continuas
# -----------------------
gg <- ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length))

# Scatter plot
gg + 
  geom_point()

# Scatter con ruido
gg +   
  geom_jitter()

# Linea
gg + 
  geom_line()

# Distribución de observaciones por eje (rug)
gg + 
  geom_rug()

# Smooth / regresión
gg + 
  geom_smooth(method = "loess")

# Texto
gg + 
  geom_text(aes(label = substr(Species, 1, 2)))

# Densidad / curvas de nivel
gg +   
  geom_density2d()

# Tiles 2D
gg + 
  geom_bin2d()


# Una variable discreta y una continua
# ------------------------------------
gg <- ggplot(iris, aes(x = Species, y = Sepal.Length))

# Barras
gg + 
  geom_bar(stat="identity")

# Scatter
gg + 
  geom_point()

# Scatter con ruido (barras con distribución)
gg + 
  geom_jitter(width=0.5)

# Boxplot
gg + 
  geom_boxplot()

# Violin
gg + 
  geom_violin()


# Una variable discreta y un rango
# --------------------------------
df <- data.frame(type = c("A", "B"), value = 4:5, variation = 1:2)
gg <- ggplot(df, aes(type, value, ymin = value - variation, ymax = value + variation))

df <- data.frame(type = c("A", "B"), value = 4:5, variation = 1:2)
k <- ggplot(df, aes(type, value, ymin = value-variation, ymax = value+variation))

# Boxplot sin bigotes
gg + 
  geom_crossbar()

# Barra de "error"
gg + 
  geom_errorbar()

# Rango por linea
gg + 
  geom_linerange()


################################### POSITIONS
# Analizamos el set de datos
str(mtcars)
head(mtcars)

# POSICIONAMIENTO DE GRÁFICOS DE BARRAS
# -------------------------------------

# Generamos un gráfico de barras 
gg <- ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(am)))
gg + 
  geom_bar()

# Posicionamiento "uno al lado del otro"
gg + 
  geom_bar(position = "dodge")

# Modificamos el posicionamiento en X para que haya solapamiento
gg + 
  geom_bar(size = 1, position = position_dodge(width = 0.5))

# Posicionamiento "uno encima del otro"
gg + 
  geom_bar(position = "stack")

# Posicionamiento "uno encima del otro normalizado"
gg + 
  geom_bar(position = "fill")



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

