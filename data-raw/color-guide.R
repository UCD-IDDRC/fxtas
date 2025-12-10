
library(ggplot2)

iris |>
  ggplot() +
  aes(x = Sepal.Length, y = Sepal.Width, col = Species) +
  geom_point() +
  ggplot2::scale_color_manual(
    guide = ggh4x::guide_stringlegend(),
    name = "Symptom category:",
    values = c("setosa" = "red", "versicolor" = "blue", "virginica" = "green")
  )
