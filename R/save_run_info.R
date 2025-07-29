#' Save run info to file
#'
#' @param output_folder a [character] indicating where to save info
#'
#' @returns [TRUE], invisibly
#' @export
#'
#' @examples
#' \dontrun{
#' save_run_info("output123/")
#' }
save_run_info <- function(output_folder) {

  file.copy("DESCRIPTION", to = output_folder, overwrite = TRUE)
  file.copy("data-raw/ordinal-sustain.R", to = output_folder, overwrite = TRUE)
  git_info <- c(
    branch = gert::git_branch(),
    gert::git_commit_info()
  )

  git_info |>
    capture.output(
      file = fs::path(output_folder, "git-info.txt"),
      append = FALSE)

  gert::git_status() |>
    capture.output(
      file = fs::path(output_folder, "git-info.txt"),
      append = TRUE)

  return(invisible(TRUE))

}
