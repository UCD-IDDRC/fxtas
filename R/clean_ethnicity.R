### clean Primary Ethnicity ###
clean_ethnicity <- function(dataset){
  dataset |>
    # recorde ethnicity factor levels
    # combine "Not Hispanic..." and "NOT Hispanic..."
    dplyr::mutate(
      `Primary Ethnicity` =
        .data$`Primary Ethnicity` |>
        forcats::fct_recode(
          # `Not Hispanic or Latino` = "Not Hispanic or Latino",
          `Not Hispanic or Latino` = "NOT Hispanic or Latino"
        )
    )
}
