clean_MRI_vars <- # nolint: object_name_linter
  function(
    dataset,
    missing_codes = c(
      "Missing/Refused (999)",
      "999",
      "Missing/Refused"
    )
  ) {
    dataset |>
      dplyr::mutate(
        across(
          .cols = all_of(MRI_vars()),
          .fns = function(x) {
            if_else(x %in% missing_codes, NA, x) |>
              droplevels() |>
              set_mri_var_label(name = cur_column())
          }
        ),

      )
  }
