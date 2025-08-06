# results are consistent with custom collapse levels

    Code
      collapse_scid_level(ordered(c(NA, "Threshold", "Absent", "Sub-Threshold")), c(
        "Sub-Threshold", "Threshold"))
    Output
      [1] <NA>                    Sub-Threshold/Threshold Absent                 
      [4] Sub-Threshold/Threshold
      Levels: Absent < Sub-Threshold/Threshold

# results are consistent with default collapse levels

    Code
      collapse_scid_level(ordered(c(NA, "Threshold", "Absent", "Sub-Threshold")))
    Output
      [1] <NA>                 Threshold            Absent/Sub-Threshold
      [4] Absent/Sub-Threshold
      Levels: Absent/Sub-Threshold < Threshold

