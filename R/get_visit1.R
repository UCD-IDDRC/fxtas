#' Get each participant's first visit in dataset
#'
#' @param dataset a [tibble::tbl_df] containing the following columns:
#' * `FXS ID`: participant ID number ([character()])
#' * `Visit Date`: date of clinic visit ([base::Date()])
#' * `Event Name`: role of clinic visit in the study design ([character()])
#'
#' @returns a [tibble::tbl_df]
#' @export
#'
#' @examples
#' test_data |> get_visit1()
get_visit1 <- function(dataset) {
  dataset |>
    arrange(
      across(
        all_of(
          c("FXS ID", "Visit Date", "Event Name")
        )
      )
    ) |>
    dplyr::mutate(.by = "FXS ID", `# visits` = n()) |>
    slice_head(n = 1, by = "FXS ID") |>
    dplyr::mutate(
      `# visits` = factor(
        .data$`# visits`,
        levels = 1:max(.data$`# visits`)
      )
    ) |>
    drop_levels() |>
    clean_gender()
}
