create_any_tremor <- function(
    dataset,
    tremor_types = c(
      "intention tremor",
      "resting tremor",
      "postural tremor",
      "intermittent tremor"
    )
)
{
  dataset |>
    dplyr::mutate(
      "any tremor (excluding head)" = case_when(
        dplyr::if_any(
          .cols = all_of(tremor_types),
          .fns = ~ . %in% "Yes"
        ) ~ "Some tremors recorded",
        dplyr::if_all(
          .cols = all_of(tremor_types),
          .fns = ~ is.na(.) | . %in% c("NA (888)", "No Response (999)")
        ) ~ NA,
        TRUE ~ "No tremors recorded"
      ) |>
        factor() |>
        relevel(ref = "No tremors recorded")
    )
}
