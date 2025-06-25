fix_FXTAS_stage <- function(dataset)
{

  output =
    dataset |>
    dplyr::mutate(
      `FXTAS Stage` =
        .data$`FXTAS Stage (0-5)` |>
        case_match(
          0.5 ~ 0,
          1.5 ~ 1,
          2.5 ~ 2,
          3.5 ~ 4,
          4.5 ~ 5,
          .default = .data$`FXTAS Stage (0-5)`) |>
        na_if(999) |>
        factor(),

      # created both to avoid missing variable in other scripts
      `FXTAS Stage (0-5): missingness reasons` =
        missingness_reasons.numeric(.data$`FXTAS Stage (0-5)`),

      `FXTAS Stage (0-5)` = .data$`FXTAS Stage (0-5)` |> clean_numeric(),

      Stage_3plus =
        case_when(
          `FXTAS Stage` %in% (3:5) ~ "3+",
          `FXTAS Stage` %in% c(0:2) ~"0-2",
          .default = NA) |>
        factor(levels = c("0-2", "3+")) |>
        labelled::set_label_attribute("FXTAS Stage"),


    )

  return(output)
}
