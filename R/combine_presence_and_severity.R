combine_presence_and_severity <- function(
  data,
  binary_varname,
  severity_varname = paste(binary_varname, "severity"),
  severity_varname_f = paste0(severity_varname, "*")
) {
  data |>
    mutate(
      "{binary_varname}" :=
        if_else(
          condition = (.data[[severity_varname]] %in% 0) &
            is.na(.data[[binary_varname]]),
          true = "No",
          false = .data[[binary_varname]]
        ) |>
        ordered(levels = c("No", "Yes")),
      "{severity_varname}" :=
        if_else(
          condition = (.data[[binary_varname]] %in% "No") &
            is.na(.data[[severity_varname]]),
          true = 0,
          false = .data[[severity_varname]]
        ),
      "{severity_varname_f}" :=
        .data[[severity_varname]] |>
        factor()
    )
}
