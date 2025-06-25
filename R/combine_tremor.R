#' @title Combine exam and history tremor vars
#' @description
#' Tremor variables have TWO versions: "ne_tremor" and "neu_tremor"
#' ne = Neurological Exam, neu = Neurological History
#' Here, we create a new Tremor variable that takes the more severe score
#' (e.g. Yes)
#' @param dataset [data.frame]
#' @param tremor_vars [character] [vector]
#'
#' @returns a modified version of `dataset`
#' @export
#'
#' @examples
#' \dontrun{
#' test_data |> combine_tremor()
#' }
combine_tremor <- function(
    dataset,
    tremor_vars = c(
      "intention tremor hx",
      "resting tremor hx",
      "postural tremor hx",
      "intention tremor exam",
      "resting tremor exam",
      "postural tremor exam",
      "head tremor hx",
      "head tremor exam"
    )) {
  dataset |>
    dplyr::mutate(
      # convert to ordered factor
      dplyr::across(
        .cols = dplyr::any_of(tremor_vars),
        ~ factor(.x, levels = c("No", "Yes"), ordered = TRUE)
      ),
      # combine using most severe score
      `resting tremor` = pmax(
        .data$`resting tremor hx`, .data$`resting tremor exam`,
        na.rm = TRUE
      ),
      `postural tremor` = pmax(
        .data$`postural tremor hx`, .data$`postural tremor exam`,
        na.rm = TRUE
      ),
      `intention tremor` = pmax(
        .data$`intention tremor hx`, .data$`intention tremor exam`,
        na.rm = TRUE
      ),

      # there's no `intermittent tremor exam` variable
      `intermittent tremor` = .data$`intermittent tremor hx`

    ) |>
    combine_head_tremor(method = "new") |>
    create_any_tremor()
}
