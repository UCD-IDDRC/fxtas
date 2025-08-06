#' @title Create SCID domain variables
#'
#' @param dataset a [tibble::tbl_df] containing all of `scid_vars` as columns
#' @param scid_vars a [character()] vector
#'
#' @returns a [tibble::tbl_df]
#' @export
#'
create_scid_domains <- function(
  dataset,
  scid_vars = all_scid_vars
) {
  # split scid_vars into current/lifetime
  # lifetime + Generalized Anxiety
  # Note: Generalized Anxiety goes with `lifetime` vars because:
  # 1) There is no lifetime version,
  # 2) it has the same Absent/Sub-Threshold/Threshold levels
  #    as the lifetime variables
  lifetime_vars <- c(scid_vars[!grepl("Current", scid_vars)],
                     "Generalized Anxiety (ANX32), Current Only")
  # current - Generalized Anxiety
  current_vars <- setdiff(scid_vars, lifetime_vars)
  # split scid_vars into the domains #
  # mood disorders
  scid_md_vars <- grep("\\(MD", scid_vars, value = TRUE)
  # substance use disorders
  scid_sud_vars <- grep("\\(SUD", scid_vars, value = TRUE)
  # anxiety
  scid_anx_vars <- grep("\\(ANX", scid_vars, value = TRUE)
  # somatization
  scid_somatic_vars <- grep("\\(SOM", scid_vars, value = TRUE)
  # psychotic
  scid_psych_vars <- grep("\\(PS", scid_vars, value = TRUE)

  # remove 'current' variables from each domain
  scid_md_vars_lif <- scid_md_vars |> intersect(lifetime_vars)
  scid_sud_vars_lif <- scid_sud_vars |> intersect(lifetime_vars)
  scid_anx_vars_lif <- scid_anx_vars |> intersect(lifetime_vars)
  scid_somatic_vars_lif <- scid_somatic_vars |> intersect(lifetime_vars)
  scid_psych_vars_lif <- scid_psych_vars |> intersect(lifetime_vars)

  dataset |>
    # convert scid_vars to ordered factors
    dplyr::mutate(
      across(
        .cols = all_of(lifetime_vars),
        ~ factor(.x, levels = c("Absent", "Sub-Threshold", "Threshold"),
                 ordered = TRUE)
      ),
      across(
        .cols = all_of(current_vars),
        ~ factor(.x, levels = c("Absent", "Present"), ordered = TRUE)
      )
    ) |>
    # create domain variables using max level
    dplyr::mutate(
      `SCID: mood disorders` = rowMax(scid_md_vars_lif),
      `SCID: substance use disorders` = rowMax(scid_sud_vars_lif),
      `SCID: anxiety disorders` = rowMax(scid_anx_vars_lif),
      `SCID: somatoform disorders` = rowMax(scid_somatic_vars_lif),
      `SCID: psychotic symptoms` = rowMax(scid_psych_vars_lif)
    )
}
