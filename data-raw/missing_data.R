library("fxtas")

variables =
  c(
    "ApoE*",
    "CGG",

    "Drug use",
    "Marijuana use",
    "Alcohol use/abuse",
    "# of drinks per day now",

    "Thyroid Cancer",
    "Skin Cancer",
    "Melanoma",
    "Prostate Cancer",
    "Other Cancer",

    "Surgery",
    "Anesthesia (medic_surg_anes)",
    "Anesthesia (new_mds_med_anes1)",

    "intention tremor",
    "resting tremor",
    "postural tremor",
    "intermittent tremor hx",
    "Any tremor",
    "tremor: age of onset",

    "head tremor hx",
    "head tremor: age of onset",

    "gait ataxia exam",
    "gait ataxia severity exam",
    "gait ataxia age of onset hx",


    grep("Parkinson", value = TRUE, names(gp34)),

    "FXTAS Stage (0-5)",

    "BDS-2 Total Score",

    "MMSE total score"

  )
