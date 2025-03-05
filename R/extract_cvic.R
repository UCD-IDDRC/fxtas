#' Extract CVIC element from an object
#'
#' @param object a `"SuStaIn_output"` object (from [run_OSA()])
#' @param ... unused
#'
#' @returns a "CVIC" object
#' @export
#'
#' @examples
#' osa_output_sim_data |> extract_cvic()
extract_cvic <- function(object, ...) {
  object |> attr("CV")
}
