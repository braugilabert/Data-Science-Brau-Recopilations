# Incluimos el paquete
library(ggplot2)


# MULTIGRÁFICOS EN UN EJE
# -----------------------

# Mostremos en un grafico quilates contra precio con identificación de claridad
gg <- ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + 
  geom_point()
gg

# De una forma mucho más clara ("desagregando" por clarity) -> (facet_wrap(~clarity))

# Veamos un gráfico de barras de distribución de precios por corte 


# Mejoremos la visualización normalizando


# Mejoremos la visualización colocando las métricas de forma adyacente


# Mejoremos la visualización desagregando por corte


# Mejoremos la visualización ordenando la desagregación (ncol = 1)




