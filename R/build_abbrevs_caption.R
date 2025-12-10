#' Build abbreviations caption
#'
#' @param abbreviations
#' a [data.frame] loaded from `"inst/analyses/abbreviations.csv"`
#' @param abbreviations_to_define
#' a [character] [vector] indicating rows of `abbreviations` to use
#'
#' @returns a [character] string
#' @export
#'
#' @examples
#' \dontrun{
#' abbreviations <- read.csv("inst/analyses/abbreviations.csv")
#'
#' abbrevs_caption <- abbreviations |>
#'  build_abbrevs_caption(
#'    abbreviations_to_define = c(
#'      "SWM",
#'      "MRI"
#'    )
#'  )
#' }
build_abbrevs_caption <- function(abbreviations,
                                  abbreviations_to_define) {
  abbrevs_caption <-
    abbreviations |>
    filter(.data$Abbreviation %in% abbreviations_to_define) |>
    mutate(equals = glue::glue("{Abbreviation} = {Meaning}")) |>
    pull("equals") |>
    paste(collapse = "; ")

  abbrevs_caption <-
    paste0("Abbreviations: ", abbrevs_caption, ".")
}
