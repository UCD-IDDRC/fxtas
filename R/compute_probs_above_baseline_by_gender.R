compute_probs_above_baseline_by_gender <- function(
    data,
    stratifying_var_names,
    biomarker_varnames
    ) {
  probs_above_baseline_by_gender <-
    data |>
    dplyr::summarize(
      .by = all_of(stratifying_var_names),
      across(
        all_of(biomarker_varnames),
        ~ mean(.x != levels(.x)[1], na.rm = TRUE)
      )
    )

  probs_above_baseline_by_gender <-
    probs_above_baseline_by_gender |>
    pivot_longer(cols = -all_of(c(stratifying_var_names)),
                 names_to = "biomarker",
                 values_to = "Pr(above_baseline)")

  probs_above_baseline_by_gender <-
    probs_above_baseline_by_gender |>
    dplyr::mutate(
      # probably want to apply formatting here (after pivoting)
      # rather than during the summarize step,
      # so that accuracy is applied per-column:
      `Pr(above_baseline)` = .data$`Pr(above_baseline)` |>
        formattable::percent(drop0trailing = TRUE, digits = 1)
    )

  pvals = compute_pvals(
    data,
    biomarker_varnames,
    stratifying_var_names)

  probs_above_baseline_by_gender <-
    probs_above_baseline_by_gender |>
    pivot_wider(
      id_cols = "biomarker",
      names_from = all_of(stratifying_var_names),
      values_from = all_of("Pr(above_baseline)")
    ) |>
    dplyr::mutate("p-value" = pvals[.data$biomarker])

  return(probs_above_baseline_by_gender)
}
