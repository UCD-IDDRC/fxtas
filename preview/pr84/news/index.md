# Changelog

## fxtas (development version)

### Manuscript

- Moved manuscript to `analyses/`
  ([\#69](https://github.com/ucd-iddrc/fxtas/issues/69))
- Tons of polishing
  ([\#63](https://github.com/ucd-iddrc/fxtas/issues/63),
  [\#64](https://github.com/ucd-iddrc/fxtas/issues/64),
  [\#65](https://github.com/ucd-iddrc/fxtas/issues/65))
- Added
  [`gtsummary::bold_labels()`](https://www.danieldsjoberg.com/gtsummary/reference/bold_italicize_labels_levels.html)
  to `gtsummary` tables
- Added keywords
- Reduced title to under 100 characters, including spaces
- Removed numbers from headings.
- Incorporated coauthors’ feedback up to 2024/11/18 draft
- Added additional line-graph comparison subfigures for latent subtype
  clustering analysis
- Added more interpretation of subtype analysis results
- Removed repeated measures analysis

### Analysis

- added info about displayed statistics to rows for
  [`compute_prob_correct()`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/compute_prob_correct.md)
  ([\#56](https://github.com/ucd-iddrc/fxtas/issues/56))

### Graphics

- added grayscale legend to PVDs
  ([\#83](https://github.com/ucd-iddrc/fxtas/issues/83))
- added test for
  [`pvd_lineplot()`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/pvd_lineplot.md)
  ([\#68](https://github.com/ucd-iddrc/fxtas/issues/68))
- added `biomarker_order` argument to
  [`compact_pvd_data_prep()`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/compact_pvd_data_prep.md)
  (default behavior should be unchanged)
- added
  [`shared_flextable_settings()`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/shared_flextable_settings.md)
  function to apply font, font size, and line spacing to all tables

### Data processing

- added tools for finding journals to submit to
  ([\#66](https://github.com/ucd-iddrc/fxtas/issues/66))
- renamed `FXTAS Stage (0-5)*` to `FXTAS Stage`
- added columns to pre-processed data:
  - `Male`
  - `CGG 100-199`
  - `CGG 55-99`
- substituted ≤ instead of \<= in dichotomized CANTAB variable value
  labels
- renamed SCID composite vars without capitalization (on Dr. Bourgeois’s
  recommendation)
- added “label” attribute to `FX3*`
- added “Disorder” suffix to SCID composite variables, on
  Dr. Bourgeois’s recommendation.
- fixed `create_any_tremor()` to handle NAs before or after
  `fix_factors()`.
- renamed “Any Autoimmune” to “any autoimmune disorder” and make it
  “Yes”/“No”
- decapitalized “MMSE Total Score” to “MMSE total score”
- decapitalized “Parkinsonian features” to “parkinsonian features”
- removed “Parkinsonian features:” prefix from:
  - “Masked faces”,
  - “Increased tone”,
  - “pill-rolling tremor exam”,
  - “Stiff gait”
- Renamed “CGG (backfilled)” to CGG
- Renamed “ApoE (backfilled)” to ApoE
- Now using most recent ApoE value

### Package setup

- updated test-coverage.yaml workflow
- updated readme to specify new location of manuscript source code in
  `analyses/`
- updated `WORDLIST`

### Linting

- configured .lintr
  ([\#74](https://github.com/ucd-iddrc/fxtas/issues/74))

### Testing

- added test for
  [`compile_biomarker_group_list()`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/compile_biomarker_group_list.md)

## fxtas 0.0.0.9000

- Added a `NEWS.md` file to track changes to the package.
