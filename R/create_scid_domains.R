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
  scid_md_vars <- scid_vars[grepl("\\(MD", scid_vars)]
  # substance use disorders
  scid_sud_vars <- scid_vars[grepl("\\(SUD", scid_vars)]
  # anxiety
  scid_anx_vars <- scid_vars[grepl("\\(ANX", scid_vars)]
  # somatization
  scid_somatic_vars <- scid_vars[grepl("\\(SOM", scid_vars)]
  # psychotic
  scid_psych_vars <- scid_vars[grepl("\\(PS", scid_vars)]

  # remove 'current' variables from each domain
  scid_md_vars_lif <- scid_md_vars[scid_md_vars %in% lifetime_vars]
  scid_sud_vars_lif <- scid_sud_vars[scid_sud_vars %in% lifetime_vars]
  scid_anx_vars_lif <- scid_anx_vars[scid_anx_vars %in% lifetime_vars]
  scid_somatic_vars_lif <-
    scid_somatic_vars[scid_somatic_vars %in% lifetime_vars]
  scid_psych_vars_lif <- scid_psych_vars[scid_psych_vars %in% lifetime_vars]

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
      # notes: could use `do.call()`, `invoke()`, `rowwise() & max()`;
      # no clearly most-idiomatic approach as of 2024-03-22
      # some discussion here:
      # https://r4ds.hadley.nz/numbers.html#numeric-transformations
      `SCID: mood disorders` = pmax(!!!rlang::syms(scid_md_vars_lif), na.rm = TRUE),
      `SCID: substance use disorders` = pmax(!!!rlang::syms(scid_sud_vars_lif), na.rm = TRUE),
      `SCID: anxiety disorders` = pmax(!!!rlang::syms(scid_anx_vars_lif), na.rm = TRUE),
      `SCID: somatoform disorders` = pmax(!!!rlang::syms(scid_somatic_vars_lif), na.rm = TRUE),
      `SCID: psychotic symptoms` = pmax(!!!rlang::syms(scid_psych_vars_lif), na.rm = TRUE)
    )
}
