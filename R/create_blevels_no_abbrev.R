create_blevels_no_abbrev <- function(biomarker_levels) {
  biomarker_levels2 <-
    biomarker_levels

  biomarker_levels2[["PAL Total errors (adjusted)*"]] <-
    biomarker_levels2[["PAL Total errors (adjusted)*"]] |>
    set_label_attribute("Paired Associates Learning Errors")

  biomarker_levels2[["MCP-WM Hyperintensity"]] <-
    biomarker_levels2[["MCP-WM Hyperintensity"]] |>
    set_label_attribute("middle cerebellar peduncle")

  biomarker_levels2[["MCP-WM Hyperintensity"]] <-
    biomarker_levels2[["MCP-WM Hyperintensity"]] |>
    set_label_attribute("middle cerebellar peduncle")

  biomarker_levels2[["MMSE total score*"]] <-
    biomarker_levels2[["MMSE total score*"]] |>
    set_label_attribute("Mini-Mental State Examination")

  biomarker_levels2[["MRI: Cerebral"]] <-
    biomarker_levels2[["MRI: Cerebral"]] |>
    set_label_attribute("Cerebral MRI Abnormalities")

  biomarker_levels2[["MRI: Cerebellar"]] <-
    biomarker_levels2[["MRI: Cerebellar"]] |>
    set_label_attribute("Cerebellar MRI Abnormalities")

  biomarker_levels2[["RTI Five-choice movement time*"]] <-
    biomarker_levels2[["RTI Five-choice movement time*"]] |>
    set_label_attribute("Five-choice reaction time")

  biomarker_levels2[["SWM Between errors*"]] <-
    biomarker_levels2[["SWM Between errors*"]] |>
    set_label_attribute("Spatial Working Memory")

  biomarker_levels2[["BDS-2 Total Score*"]] <-
    biomarker_levels2[["BDS-2 Total Score*"]] |>
    set_label_attribute("Behavioral Dyscontrol Scale")

  return(biomarker_levels2)
}
