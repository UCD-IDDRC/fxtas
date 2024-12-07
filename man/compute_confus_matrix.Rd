% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_confus_matrix.R
\name{compute_confus_matrix}
\alias{compute_confus_matrix}
\title{compute \code{confus_matrix} as in python version}
\usage{
compute_confus_matrix(
  samples_sequence,
  biomarker_event_order = attr(samples_sequence, "biomarker_event_names")
)
}
\arguments{
\item{samples_sequence}{todo}

\item{biomarker_event_order}{todo}
}
\value{
a \link[tibble:tbl_df-class]{tibble::tbl_df}
}
\description{
compute \code{confus_matrix} as in python version
}
\examples{
samples_sequence = matrix(
   nrow = 2,
   byrow = TRUE,
   dimnames = list(
     iteration = NULL,
     position = paste("Event #", 1:10)),
   data = paste(
     "biomarker",
     c(0,2,4,6,8,9,7,5,3,1,
       0,1,2,3,4,5,6,7,8,9)))
compute_confus_matrix(samples_sequence)

}
