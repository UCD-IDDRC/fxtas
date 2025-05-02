create_any_tremor <- function(
    dataset,
    tremor_types = c(
      "Hx Intention tremor",
      "Exam Intention tremor",
      "Hx Resting tremor",
      "Exam Resting tremor",
      "Hx Postural tremor",
      "Exam Postural tremor",
      "Intermittent tremor"
    )
)
{
  dataset |>
    dplyr::mutate(
      "Any tremor (excluding head)" = case_when(
        dplyr::if_any(
          .cols = all_of(tremor_types),
          .fns = ~ . %in% "Yes"
        ) ~ "Some tremors recorded",
        dplyr::if_all(
          .cols = all_of(tremor_types),
          .fns = ~  . %in% c(NA, "NA (888)", "No Response (999)")
        ) ~ NA,
        TRUE ~ "No tremors recorded"
      ) |>
        factor() |>
        relevel(ref = "No tremors recorded")
    )
}
