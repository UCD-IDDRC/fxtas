#' Extract results from pickle file
#'
#' @param n_s
#' number of latent subgroups; helps construct `picklename`
#' @param dataset_name root name of dataset
#' @param output_folder where to find the dataset
#' @param picklename the name of the pickle file to open
#' @param format_results
#' whether to apply [format_results_list()] to results before returning
#' @param verbose whether to print messages
#' @param basename base of pickle file name (without `.pickle` suffix)
#' @param use_rds [logical] whether to use previously cached results
#' @param save_rds a [logical] indicating whether to save new cached results
#' @param subtype_order an [integer] vector of length `n_s`,
#' indicating how to order the subtypes
#' @inheritDotParams format_results_list format_sst
#' @inherit format_results_list return
#' @export
#' @examples
#' output_path <-
#'   fs::path_package("extdata/sim_data", package = "fxtas")
#' results <- extract_results_from_pickle(
#'   n = 3,
#'   output_folder = output_path, use_rds = FALSE
#' )
extract_results_from_pickle <- function(
    n_s = 1,
    dataset_name = "sample_data",
    output_folder = "output",
    basename = paste0(dataset_name, "_subtype", n_s - 1),
    picklename = paste0(basename, ".pickle"),
    format_results = TRUE,
    subtype_order = seq_len(n_s),
    use_rds = TRUE,
    save_rds = format_results & identical(subtype_order, seq_len(n_s)),
    verbose = FALSE,
    ...) {
  rds_path <- build_rds_path(
    dataset_name = basename,
    output_folder = output_folder
  )

  if (use_rds && file.exists(rds_path)) {
    if (verbose) {
      cli::cli_inform(
        c(
          "i" = "loading {basename} results from RDS file:",
          rds_path
        )
      )
    }
    results <- readr::read_rds(rds_path)
  } else {
    if (verbose) {
      cli::cli_inform(
        c(
          "i" = "loading {basename} results from pickle file:",
          picklename
        )
      )
    }

    results00 <-
      fs::path(output_folder, "pickle_files", picklename) |>
      py_load_object(convert = TRUE) |>
      force()

    biomarker_levels <-
      output_folder |>
      fs::path("biomarker_levels.rds") |>
      readr::read_rds()

    biomarker_groups <-
      output_folder |>
      fs::path("biomarker_groups.rds") |>
      readr::read_rds()

    if (format_results) {
      results <-
        results00 |>
        format_results_list(
          biomarker_levels = biomarker_levels,
          biomarker_groups = biomarker_groups,
          subtype_order = subtype_order,
          ...
        )

    } else {
      results <- results00
    }

    if (save_rds) {
      results |> saveRDS(file = rds_path)
    }
  }

  return(results)
}

#' Extract results from multiple pickle files
#'
#' @inheritParams extract_results_from_pickle
#' @inheritDotParams format_results_list format_sst
#' @returns a [list] of `"SuStaIn_model"` objects (extends [list()])
#' @export
#'
extract_results_from_pickles <-
  extract_results_from_pickle |>
  Vectorize(vectorize.args = c("n_s", "picklename"), SIMPLIFY = FALSE)
