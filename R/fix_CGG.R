fix_CGG <- function(dataset)
{
  missingCGG = readxl::read_excel(
    "inst/extdata/Missing CGG repeat import_24Mar23.xlsx",
    sheet = "missing_CGG")

  colnames(missingCGG)[3] = "CGG (recovered)"

  # import additiona missingCGG data (10/2023)
  updatedCGG = readxl::read_xlsx(
    "inst/extdata/GP3 & GP4 - Missing CGG Data Samples Table - 10-9-2023-mdp.xlsx"
  ) |>
    dplyr::mutate(
      Study = substr(.data$`Event Name`, start = 1, stop = 3),
      # remove second FXS ID from "500011-608/108094-100" for now
      `FXS ID` = substr(.data$`FXS ID`, start = 1, stop = 10),
      # convert "NA" string to NA_character
      `CGG (backfilled)` = dplyr::na_if(
        .data$`CGG (backfilled)`,
        "NA"
      )
    ) |>
    dplyr::relocate(
      "Study", .before = "FXS ID"
    ) |>
    dplyr::rename(
      `CGG (recovered)` = "CGG (backfilled)"
    ) |>
    dplyr::select(
      all_of(colnames(missingCGG))
    )

  # combine previous and updated missingCGG data
  # additional update should contain duplicates from previous missingCGG
  newCGG <- rbind(missingCGG, updatedCGG) |>
    arrange(across(all_of("FXS ID"))) |>
    # remove non-unique rows, e.g. still missing CGG
    unique() |>
    # add count
    add_count(.data$`FXS ID`) |>
    # if count == 2, remove obs with missing CGG
    dplyr::filter(
      !(n == 2 & is.na(.data$`CGG (recovered)`))
    ) |>
    # remove count variable
    dplyr::select(-all_of("n"))



  duplicates =
    newCGG |>
    count(.data$`FXS ID`) |>
    dplyr::filter(.data$n != 1)

  if(nrow(duplicates) != 0) browser(message("why are there duplicates?"))

  dataset =
    dataset |>
    left_join(
      newCGG |> dplyr::select(-all_of("Study")),
      by = "FXS ID",
      relationship = "many-to-one"
    ) |>
    dplyr::mutate(
      `Floras Non-Sortable Allele Size (CGG) Results` =
        if_else(
          is.na(.data$`Floras Non-Sortable Allele Size (CGG) Results`),
          .data$`CGG (recovered)`,
          .data$`Floras Non-Sortable Allele Size (CGG) Results`
        ),
      `CGG (recovered)` = NULL,
      CGG =
        .data$`Floras Non-Sortable Allele Size (CGG) Results` |>
        parse_CGG(),

      `CGG: missingness reasons` =
        missingness_reasons.numeric(
          x = .data$`Floras Non-Sortable Allele Size (CGG) Results`,
          x.clean = .data$CGG
        ),
      `CGG (backfilled)` = .data$CGG
    )  |>
    dplyr::relocate(
      "CGG (backfilled)", .after = "CGG"
    ) |>
    dplyr::mutate(
      .by = "FXS ID",
      `CGG (backfilled)` = `CGG (backfilled)` |> last(na_rm = TRUE) # more recent assays may be more accurate
    ) |>
    rename(
      `CGG (before backfill)` = "CGG",
      CGG = "CGG (backfilled)"
    ) |>
    dplyr::mutate(
      CGG = .data$CGG |> structure(label = "CGG repeats")
    )

  return(dataset)
}
