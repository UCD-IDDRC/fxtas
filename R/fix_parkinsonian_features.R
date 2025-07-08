fix_parkinsonian_features <- function(data) {

  data <- data |>
    mutate(
      # there's no `pill-rolling tremor history` variable
      `pill-rolling tremor` = .data$`pill-rolling tremor exam`
    )

  pfs <- c( # nolint: object_usage_linter
    "parkinsonian features",
    "Stiff gait",
    "Masked faces",
    "Increased tone",
    "pill-rolling tremor"
  )

  data <- data |>
    mutate(
      pfs_original = .data$`parkinsonian features`,
      `parkinsonian features` =
        case_when(
          if_any(all_of(pfs), .fns = ~.x == "Yes") ~ "Yes",
          if_any(all_of(pfs), .fns = ~.x == "No") ~ "No",
          .default = NA
        ) |>
        factor(levels = c("No", "Yes")) |>
        labelled::set_label_attribute("parkinsonian features")

    )

  return(data)
}
