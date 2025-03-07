# fix Visit Date for Trax data
fix_date <- function(dataset){
  dataset |>
    dplyr::mutate(
      `Visit Date` = as.Date(.data$`Visit Date`, format = "%m/%d/%Y")
    )
}
