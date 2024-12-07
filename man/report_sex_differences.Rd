% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/report_sex_differences.R
\name{report_sex_differences}
\alias{report_sex_differences}
\title{Report sex differences}
\usage{
report_sex_differences(table, cutoff = 0.05)
}
\arguments{
\item{table}{output from \code{\link[=make_biomarkers_table]{make_biomarkers_table()}}}

\item{cutoff}{\code{\link[=numeric]{numeric()}} p-value cutoff for significance}
}
\value{
a \code{\link[=character]{character()}} string
}
\description{
Report sex differences
}
\examples{
biomarker_groups = compile_biomarker_groups_table(
   dataset = test_data_v1)

biomarker_varnames =
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels =
test_data_v1 |>
  get_levels(biomarker_varnames)

biomarker_events_table =
  construct_biomarker_events_table(
    biomarker_levels,
    biomarker_groups = biomarker_groups)

table = test_data_v1 |> make_biomarkers_table(
  biomarker_events_table = biomarker_events_table,
  biomarker_varnames = biomarker_varnames
  )

  table |> report_sex_differences(cutoff = 0.5)

}
