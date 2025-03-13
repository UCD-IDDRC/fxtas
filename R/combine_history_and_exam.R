combine_history_and_exam <- function(
  data,
  output_varname,
  history_varname = paste(output_varname, "hx"),
  exam_varname = paste(output_varname, "exam")
) {
  data |>
    rowwise() |>
    mutate(
      "{output_varname}" :=
        do.call(
          what = function(...) pmax(..., na.rm = TRUE),
          across(any_of(c(history_varname, exam_varname)))
        )
    ) |>
    ungroup()
}
