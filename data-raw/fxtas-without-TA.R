library(dplyr)
trax_gp34_v1 |>
  filter(
    # `FXTAS Stage (0-5)` >= 2,
    new_mds_fxtas_dx %in% c("Possible", "Probable", "Definite"),
    ataxia %in% c(NA, "No"),
    `any tremor (excluding head)` != "Some tremors recorded",
    `ataxia severity` %in% c(0, NA),
    `Tandem Walk` %in% c(NA, "Normal")
    ) |>
  select(
    `FXS ID`,
    `Event Name`,
    `FXTAS Stage (0-5)`,
    new_mds_fxtas_dx,
    "intention tremor",
    "resting tremor",
    "postural tremor",
    "intermittent tremor",
    `any tremor (excluding head)`,
    `head tremor`,
    `ataxia severity`,
    ataxia,
    `Tandem Walk`
  ) |>
  View()
