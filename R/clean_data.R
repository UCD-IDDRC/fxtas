clean_data <- function(dataset) {
  to_return <-
    dataset |>
    dplyr::arrange(
      across(
        all_of(
          c(
            "FXS ID",
            "Visit Date",
            "Event Name"
          )
        )
      )
    ) |>
    remove_unneeded_records() |>
    dplyr::relocate("Visit Date", .after = "Event Name") |>
    clean_head_tremor_onset() |>

    combine_tremor() |>
    fix_tremor_onsets() |>

    fix_onset_age_vars()

  to_return <- to_return |>

    clean_kinesia() |>
    # includes BDS, MMSE
    make_vars_numeric(regex = "score", ignore.case = TRUE) |>

    make_vars_numeric(regex = "Purdue pegboard") |>
    make_vars_numeric(regex = "SCL90") |>
    categorize_SCL90() |>


    create_any_cancer() |>

    create_any_autoimmune() |>


    categorize_BDS() |>

    # make_vars_numeric(regex = "BDS-2 Total Score") |> # nolint: commented_code_linter
    # make_vars_numeric(regex = "MMSE total score") |> # nolint: commented_code_linter

    # `Drugs used` is unstructured text, with typos; unusable
    # fix_drugs_used() |> # nolint: commented_code_linter

    categorize_MMSE() |>

    fix_ApoE() |>

    fix_CGG() |>

    dplyr::relocate(contains("CGG"), .after = contains("ApoE")) |>

    fix_FXTAS_stage() |>
    clean_fxtas_dx() |>

    fix_demographics() |>

    clean_MRI_vars() |>

    clean_cantab() |>

    clean_SCID() |>

    fix_drinks_per_day() |>

    # create SCID and MRI domains
    create_scid_domains() |>
    create_mri_domains() |>

    # cases and controls
    define_cases_and_controls() |>

    # Ataxia
    clean_ataxia() |>

    fix_factors() |>

    # clean/recode race and ethnicity
    categorize_primary_race() |>
    # clean_ethnicity() |> # fixed upstream during data import
    create_race_ethnicity() |>

    drop_levels(except = exceptions_to_droplevels) |>

    clean_gender() |>  # droplevels() removes attributes
    fix_parkinsonian_features()

  to_return <- to_return |>
    add_labels()

  return(to_return)
}
