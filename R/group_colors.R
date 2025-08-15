#' Extract group colors
#'
#' @param object an object
#'
#' @returns a named [character] [vector] mapping
#' from `biomarker_group` to a color palette
#' @export
#'
#' @examples
#' \dontrun{}
#' figs <- readr::read_rds(
#'  fs::path_package("fxtas", "extdata/sim-figs-4.rds")
#' )
#' group_colors(figs)
group_colors <- function(object) {
  UseMethod("group_colors")
}

#' @export
group_colors.PVD_list <- function(object) {
  object |>
    attr("biomarker_groups") |>
    attr("group_colors") |>
    pull("group_color")
}

#' @export
group_colors.list <- function(object) {
  object[[1]] |>
    attr("biomarker_groups") |>
    attr("group_colors") |>
    pull("group_color")
}
