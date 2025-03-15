clean_fxtas_dx <- function(data) {
  data |>
    mutate(
      across(
        all_of(
          c(
            "mds_fxtas_dx", "new_mds_fxtas_dx"
          )
        ),
        replace_missing_codes_with_NAs
      ),
      fxtas_dx = coalesce(new_mds_fxtas_dx, mds_fxtas_dx) |>
        ordered() |>
        set_label_attribute("FXTAS diagnosis")
    )
}
