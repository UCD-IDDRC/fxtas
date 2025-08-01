#' Save run info to file
#'
#' @param output_folder a [character] indicating where to save info
#' @param script [character]: name of script to copy
#' @returns [TRUE], invisibly
#' @export
#'
#' @examples
#' \dontrun{
#' save_run_info("output123/")
#' }
save_run_info <- function(output_folder,
                          script = "ordinal-sustain.R") {

  file.copy("DESCRIPTION", to = output_folder, overwrite = TRUE)
  file.copy(
    fs::path("data-raw", script),
    to = output_folder, overwrite = TRUE)
  file.rename(
    fs::path(output_folder, "DESCRIPTION"),
    fs::path(output_folder, "DESCRIPTION-COPY")
  )
  file.rename(
    fs::path(output_folder, script),
    fs::path(output_folder, paste0("COPY-OF-", script))
  )
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
