# Clear existing data and graphics
rm(list = ls())
graphics.off()
# Load Hmisc library
devtools::load_all()
library(Hmisc)
library(dplyr)
library(vroom)
library(forcats)
library(lubridate)
library(tidyr)
# Read Data
library(conflicted)
conflicts_prefer(vroom::cols)
conflicts_prefer(vroom::col_date)
conflicts_prefer(vroom::col_character)
conflicts_prefer(vroom::col_integer)
conflicts_prefer(vroom::col_double)
conflicts_prefer(vroom::col_logical)
conflicts_prefer(vroom::col_skip)

conflicted::conflict_prefer("label", "Hmisc")
conflicted::conflict_prefer("not", "magrittr")
conflicted::conflicts_prefer(dplyr::filter)

dataset <- vroom::vroom(
  "inst/extdata/CTSC1647Trajectories-Ezra_DATA_2025-03-24_1045.csv",
  col_types = trax_col_types
)


# Setting Factors(will create new variable for factors)
dataset$redcap_event_name <- factor(
  dataset$redcap_event_name,
  levels = c(
    "visit_1_arm_1", "visit_2_arm_1", "visit_3_arm_1", "visit_1_arm_2",
    "visit_2_arm_2", "visit_3_arm_2", "visit_4_arm_2"
  )
)

dataset <- dataset |>
  set_factor_levels_trax()

# remove mol_cggrep02 if all are missing
if (all(is.na(dataset$mol_cggrep02))) {
  dataset <- dataset |>
    dplyr::select(
      -mol_cggrep02
    )
} else {
  browser(
    message(
      "Check why `mol_cggrep02` is no longer all missing"
    )
  )
}


# split data by redcap_visit_name: Arm 1 and Arm 2
data_arm1 <- dataset |>
  dplyr::filter(stringr::str_detect(redcap_event_name, "Arm 1")) |>
  # remove new_mds/new_ds variables
  dplyr::select(
    -c(
      starts_with("new_mds"),
      starts_with("new_ds"),
      otspsfc,
      paltea28,
      rtifmdmt,
      sstmrtg,
      rvpa,
      swmbe468
    )
  )

data_arm2 <- dataset |>
  dplyr::filter(stringr::str_detect(redcap_event_name, "Arm 2")) |>
  # remove mds_med variables
  dplyr::select(-c(starts_with("mds"), starts_with("cantab")))

# create labels for arm1 and arm2
labels_arm1 <- create_trax_labels(data_arm1)
labels_arm2 <- create_trax_labels(data_arm2)

# if column names and label names match -> update names with labels
compare_names_and_labels(names(data_arm1), labels_arm1)
names(data_arm1) <- labels_arm1[names(data_arm1)]


compare_names_and_labels(names(data_arm2), labels_arm2)
names(data_arm2) <- labels_arm2[names(data_arm2)]


# bind arm1 and arm2 back together
trax <- dplyr::bind_rows(
  "Trax Phase 1" = data_arm1,
  "Trax Phase 2" = data_arm2,
  .id = "Study"
) |>
  mutate(
    `Tandem Walk` = NA,
    `Activation Ratio (0.0-1.0)` = NA,
    # mds_fxtas_dx = NA,
    # new_mds_fxtas_dx = NA
  ) |>
  # clean trax data
  clean_trax_data()

if (data_exists("trax")) {

  test <- waldo::compare(
    y = trax,
    x = fxtas::trax,
    ignore_attr = "problems"
  ) |> print()

  if (length(test) > 0) {
    browser("are you sure you want to overwrite?")
  }

}


# get first visit
trax_visit1 <- trax |>
  get_visit1()

usethis::use_data(trax, overwrite = TRUE)
usethis::use_data(trax_visit1, overwrite = TRUE)

library(dplyr)

trax$`FXS ID` |> intersect(gp34$`FXS ID`)

trax_gp34_all <-
  trax |>
  bind_rows(gp34) |>
  semi_join(obs_to_use) |> # limit to obs we had in first submission
  clean_gender() |> # re-add label
  add_labels() # `bind_rows()` removes them

visit1 <-
  trax_gp34_v1 <-
  trax_gp34_all |>
  get_visit1()

trax_gp34_multivisit_only <-
  trax_gp34_all |>
  dplyr::filter(!is.na(`FXS ID`)) |>
  dplyr::filter(
    .by = `FXS ID`,
    n() > 1
  )

use_data(visit1, overwrite = TRUE)
use_data(trax_gp34_all, overwrite = TRUE)
use_data(trax_gp34_v1, overwrite = TRUE)

males_gp34_trax <-
  trax_gp34_all |>
  dplyr::filter(Gender == "Male")

use_data(males_gp34_trax, overwrite = TRUE)

males_gp34_trax_v1 <-
  males_gp34_trax |>
  get_visit1()

gp3_ids <- gp34[gp34$Study == "GP3" & gp34$Gender == "Male", ]$`FXS ID`
gp4_ids <- gp34[gp34$Study == "GP4" & gp34$Gender == "Male", ]$`FXS ID`
trax_ids <- trax$`FXS ID`

males_gp34_trax_v1 <-
  males_gp34_trax_v1 |>
  dplyr::mutate(
    "GP3" = ifelse(`FXS ID` %in% gp3_ids, "GP3", NA_character_),
    "GP4" = ifelse(`FXS ID` %in% gp4_ids, "GP4", NA_character_),
    "TRAX" = ifelse(`FXS ID` %in% trax_ids, "TRAX", NA_character_)
  ) |>
  unite(
    col = "Studies", GP3, GP4, TRAX, sep = ", ", remove = FALSE, na.rm = TRUE
  )


usethis::use_data(males_gp34_trax_v1, overwrite = TRUE)
