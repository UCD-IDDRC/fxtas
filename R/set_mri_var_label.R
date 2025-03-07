set_mri_var_label <- function(var, name) {
  var |> labelled::set_label_attribute(
    name |> expand_mri_abbreviations()
  )
}

expand_mri_abbreviations <- function(string) {
  string |>
    stringr::str_replace(fixed("-WM"), " White Matter") |>
    stringr::str_replace(fixed("WM"), "White Matter")
}

set_mri_var_labels <- function(data) {
  data |>
    dplyr::mutate(
      across(
        .cols = all_of(MRI_vars()),
        .fns = function(x) {
          x |> set_mri_var_label(name = cur_column())
        }
      )
    )
}
