remove_unneeded_records <- function(dataset) {
  dataset |>
    dplyr::filter(
      # duplicate of GP4 visit 1;
      # note from Ellery Santos, 2022-12-19, in word doc:
      !(
        .data$`FXS ID` == "100429-700" &
          .data$`Event Name` == "GP3 - Visit 1"
      ),
      # note from Ellery Santos, 2022-12-19, in word doc:
      .data$`FXS ID` != "500011-190",
      .data$`FXS ID` != "999999-999",
      .data$`FXS ID` != "1"
    )
}
