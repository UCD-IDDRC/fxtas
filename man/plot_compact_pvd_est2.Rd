% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_compact_pvd_est2.R
\name{plot_compact_pvd_est2}
\alias{plot_compact_pvd_est2}
\title{Plot SuStaIn Sequential Estimate}
\usage{
plot_compact_pvd_est2(
  figs,
  tile_height = 1,
  tile_width = 1,
  y_text_size = 9,
  legend.position = "none",
  scale_colors = c("red", "blue", "purple4", "darkgreen", "magenta"),
  rel_heights = c(1, 0.1),
  ...
)
}
\arguments{
\item{figs}{todo}

\item{tile_height}{todo}

\item{tile_width}{todo}

\item{y_text_size}{todo}

\item{legend.position}{todo}

\item{scale_colors}{todo}

\item{rel_heights}{relative heights of the plot and the legend}

\item{...}{arguments passed to \code{tmp_func()}}
}
\description{
Plot SuStaIn Sequential Estimate
}
\examples{
figs <- extract_figs_from_pickle(
  n_s = 4,
  dataset_name = "sample_data",
  output_folder = fs::path_package("fxtas", "extdata/sim_data/"),
  use_rds = TRUE
)

plot_compact_pvd_est2(
  figs = figs,
  tile_height = 1,
  y_text_size = 6,
  title_size = 8
)
}
