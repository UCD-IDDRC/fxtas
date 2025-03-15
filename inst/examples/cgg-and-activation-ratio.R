library(tidyverse)
fd <- trax_gp34_v1 |>
  dplyr::filter(
    Gender == "Female",
    CGG >= 55,
    CGG < 200
  )

fd |> select(
  CGG = `Floras Non-Sortable Allele Size (CGG) Results`,
  AR = `Activation Ratio (0.0-1.0)`
)

fd |>
  ggplot() +
  aes(x = .data$CGG,
      y = .data$`Activation Ratio (0.0-1.0)`) +
  geom_point() +
  geom_smooth() +
  ggplot2::ylim(0, 1)
