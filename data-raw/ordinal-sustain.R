## ----setup-------------------------------------------------------------------------------------------
#| message: false
cli::cli_alert_info('\nStarting at: {Sys.time()}')

library(reticulate)
# reticulate::use_condaenv("fxtas39", required = TRUE)
py_config()

devtools::load_all()
library(tidyverse)
library(pander)

if(!reticulate::py_module_available("pySuStaIn"))
{
  stop("pySuStaIn is not installed correctly.")
}

## ----------------------------------------------------------------------------------------------------
# reticulate::use_condaenv(condaenv = "fxtas")
reticulate::py_discover_config()
reticulate::py_config()

## ----------------------------------------------------------------------------------------------------
#| label: "set run parameters"
#|
fit_models = TRUE
# fit_models = FALSE
run_cv =  TRUE
# run_cv = FALSE

N_startpoints = 10L
use_parallel_startpoints = TRUE
use_parallel_startpoints = FALSE
N_S_max = 8L
N_S_max_stratified = 2L
N_CV_folds = 10L
rerun = TRUE
# rerun = FALSE
plot_python = TRUE
fig_size = c(20, 10)

args = commandArgs(trailingOnly = TRUE)
message("args = ", args |> paste(collapse = "; "))
if(N_CV_folds == 0)
{
  CV_fold_nums = NULL
} else if(length(args) == 0 & N_CV_folds > 0)
{

  CV_fold_nums = 1:N_CV_folds

} else
{

  CV_fold_nums = as.integer(as.character(args[1]))

}
N_iterations_MCMC = 1e5L
dataset_name = 'sample_data'
root_dir = here::here()
setwd(root_dir)
output_folder =
  "output/output.fixed_CV" |>
  fs::dir_create()


## ----------------------------------------------------------------------------------------------------
# note: there are 231 records in `visit1` with CGG >= 55, but 4 have CGG >= 200
# previously `nrow(v1_usable_cases)` was 221, which was based on incorrectly filtering on a version of CGG that hadn't been backfilled.

# March 2024, main analysis now uses Trax/GP34 Visit 1 data replacing previous version using only GP34
load("data/trax_gp34_v1.rda")
df =
  trax_gp34_v1 |>
  dplyr::filter(
    !is.na(`FX*`),
    # exclude patients with CGG > 200 (full mutation)
    CGG < 200)

biomarker_groups = compile_biomarker_groups_table(dataset = df)

SuStaInLabels =
  biomarker_varnames =
  biomarker_groups |>
  dplyr::pull("biomarker")


biomarker_levels =
  lapply(df[,biomarker_varnames], F = levels)

biomarker_events_table =
  construct_biomarker_events_table(
    biomarker_levels,
    biomarker_groups)

cli::cli_inform("Biomarkers used in analysis:")
table_out =
  biomarker_events_table |>
  dplyr::select(category = biomarker_group, biomarker, levels) |>
  slice_head(by = biomarker) |>
  pander()



## ----------------------------------------------------------------------------------------------------

control_data =
  df |>
  dplyr::filter(`FX*` == "CGG <55") |>
  dplyr::select(all_of(biomarker_varnames))

patient_data =
  df |>
  # na.omit() |>
  dplyr::filter(`FX*` == "CGG \u2265 55")

message("`nrow(patient_data)` = ", nrow(patient_data))

prob_correct =
  control_data |>
  compute_prob_correct(
    max_prob = .95,
    biomarker_levels = biomarker_levels)

if(length(args) == 0 || args[1] == 1)
{
  save.image(file = fs::path(output_folder, "data.RData"))
  save.image(file = fs::path(output_folder, paste0(dataset_name, ".RData")))
  patient_data     |> readr::write_rds(file = fs::path(output_folder, "data.rds"))
  biomarker_levels |> readr::write_rds(file = fs::path(output_folder, "biomarker_levels.rds"))
  biomarker_groups |> readr::write_rds(file = fs::path(output_folder, "biomarker_groups.rds"))
}



## ----"run OSA from R"--------------------------------------------------------------------------------
#| message: false
#| label: model-all-data
#| include: false
sustain_output = run_and_save_OSA(
  biomarker_levels = biomarker_levels,
  prob_correct = prob_correct,
  SuStaInLabels = SuStaInLabels,
  N_startpoints = N_startpoints,
  N_S_max = N_S_max,
  N_iterations_MCMC = N_iterations_MCMC,
  output_folder = output_folder,
  dataset_name = dataset_name,
  use_parallel_startpoints = use_parallel_startpoints,
  plot = plot_python,
  fig_size = fig_size,
  rerun = rerun,
  patient_data = patient_data,
  N_CV_folds = N_CV_folds,
  CV_fold_nums = CV_fold_nums)

## ----------------------------------------------------------------------------------------------------
#| message: false
#| label: model-males
#| include: false
sustain_output_males = run_and_save_OSA(
  biomarker_levels = biomarker_levels,
  prob_correct = prob_correct,
  patient_data = patient_data |> dplyr::filter(Gender == "Male"),
  SuStaInLabels = SuStaInLabels,
  N_startpoints = N_startpoints,
  N_S_max = N_S_max_stratified,
  N_iterations_MCMC = N_iterations_MCMC,
  output_folder = output_folder,
  dataset_name = "males",
  rerun = rerun,
  use_parallel_startpoints = use_parallel_startpoints,
  plot = plot_python,
  fig_size = fig_size)



## ----------------------------------------------------------------------------------------------------
#| message: false
#| label: model-females
#| include: false
sustain_output_females = run_and_save_OSA(
  biomarker_levels = biomarker_levels,
  prob_correct = prob_correct,
  patient_data = patient_data |> dplyr::filter(Gender == "Female"),
  SuStaInLabels = SuStaInLabels,
  N_startpoints = N_startpoints,
  N_S_max = N_S_max_stratified,
  N_iterations_MCMC = N_iterations_MCMC,
  output_folder = output_folder,
  dataset_name = "females",
  rerun = rerun,
  use_parallel_startpoints = use_parallel_startpoints,
  plot = plot_python,
  fig_size = fig_size)



## ----------------------------------------------------------------------------------------------------
#| message: false
#| label: "cgg_over_100"
#| include: false
sustain_output_cgg100plus = run_and_save_OSA(
  biomarker_levels = biomarker_levels,
  prob_correct = prob_correct,
  patient_data = patient_data |> dplyr::filter(`CGG` >= 100),
  SuStaInLabels = SuStaInLabels,
  N_startpoints = N_startpoints,
  N_S_max = N_S_max_stratified,
  N_iterations_MCMC = N_iterations_MCMC,
  output_folder = output_folder,
  dataset_name = "over100",
  rerun = rerun,
  use_parallel_startpoints = use_parallel_startpoints,
  plot = plot_python,
  fig_size = fig_size)



## ----------------------------------------------------------------------------------------------------
#| message: false
#| label: "cgg_under_100"
#| include: false
sustain_output_cgg100minus = run_and_save_OSA(
  biomarker_levels = biomarker_levels,
  prob_correct = prob_correct,
  patient_data = patient_data |> dplyr::filter(`CGG` < 100),
  SuStaInLabels = SuStaInLabels,
  N_startpoints = N_startpoints,
  N_S_max = N_S_max_stratified,
  N_iterations_MCMC = N_iterations_MCMC,
  output_folder = output_folder,
  dataset_name = "under100",
  rerun = rerun,
  use_parallel_startpoints = use_parallel_startpoints,
  plot = plot_python,
  fig_size = fig_size)

## ----------------------------------------------------------------------------------------------------
#| message: false
#| label: "cgg_over_100 & Male"
#| include: false
sustain_output_cgg100plus_males = run_and_save_OSA(
  biomarker_levels = biomarker_levels,
  prob_correct = prob_correct,
  patient_data = patient_data |>
    dplyr::filter(
      `CGG` >= 100,
      Gender == "Male"),
  SuStaInLabels = SuStaInLabels,
  N_startpoints = N_startpoints,
  N_S_max = N_S_max_stratified,
  N_iterations_MCMC = N_iterations_MCMC,
  output_folder = output_folder,
  dataset_name = "over100_Male",
  rerun = rerun,
  use_parallel_startpoints = use_parallel_startpoints,
  plot = plot_python,
  fig_size = fig_size)



## ----------------------------------------------------------------------------------------------------
#| message: false
#| label: "cgg_under_100 & Male"
#| include: false
sustain_output_cgg100minus_males = run_and_save_OSA(
  biomarker_levels = biomarker_levels,
  prob_correct = prob_correct,
  patient_data = patient_data |>
    dplyr::filter(
      `CGG` < 100,
      Gender == "Male"),

  SuStaInLabels = SuStaInLabels,
  N_startpoints = N_startpoints,
  N_S_max = N_S_max_stratified,
  N_iterations_MCMC = N_iterations_MCMC,
  output_folder = output_folder,
  dataset_name = "under100_Male",
  rerun = rerun,
  use_parallel_startpoints = use_parallel_startpoints,
  plot = plot_python,
  fig_size = fig_size)

## ----------------------------------------------------------------------------------------------------
#| message: false
#| label: "cgg_over_100 & Female"
#| include: false
sustain_output_cgg100plus_females = run_and_save_OSA(
  biomarker_levels = biomarker_levels,
  prob_correct = prob_correct,
  patient_data = patient_data |>
    dplyr::filter(
      `CGG` >= 100,
      Gender == "Female"),

  SuStaInLabels = SuStaInLabels,
  N_startpoints = N_startpoints,
  N_S_max = N_S_max_stratified,
  N_iterations_MCMC = N_iterations_MCMC,
  output_folder = output_folder,
  rerun = rerun,
  dataset_name = "over100_Female",
  use_parallel_startpoints = use_parallel_startpoints,
  plot = plot_python,
  fig_size = fig_size)



## ----------------------------------------------------------------------------------------------------
#| message: false
#| label: "cgg_under_100 & Female"
#| include: false
sustain_output_cgg100minus_females = run_and_save_OSA(
  biomarker_levels = biomarker_levels,
  prob_correct = prob_correct,
  patient_data = patient_data |>
    dplyr::filter(`CGG` < 100,
           Gender == "Female"),
  SuStaInLabels = SuStaInLabels,
  N_startpoints = N_startpoints,
  N_S_max = N_S_max_stratified,
  N_iterations_MCMC = N_iterations_MCMC,
  output_folder = output_folder,
  rerun = rerun,
  dataset_name = "under100_Female",
  use_parallel_startpoints = use_parallel_startpoints,
  plot = plot_python,
  fig_size = fig_size)

cli::cli_alert_info('\nEnding at: {Sys.time()}')
