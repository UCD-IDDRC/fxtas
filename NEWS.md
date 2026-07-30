# fxtas (development version)

## Internal

* Updated the reusable GitHub Actions workflows to call `Morrison-Lab/gha`
  instead of `d-morrison/gha`, following that repository's move.
  Actions does not follow repository-rename redirects for `uses:`, so the
  calls were failing to resolve before any job started.
* Added a scheduled `Clean up PR Previews` workflow that prunes closed-PR `gh-pages` previews and compacts `gh-pages` history, so deleted render snapshots stop bloating the repo (closes #155).

## Manuscript

* Moved manuscript to `analyses/` (#69)
* Tons of polishing (#63, #64, #65)
* Added `gtsummary::bold_labels()` to `gtsummary` tables
* Added keywords
* Reduced title to under 100 characters, including spaces
* Removed numbers from headings.
* Incorporated coauthors' feedback up to 2024/11/18 draft
* Added additional line-graph comparison subfigures
for latent subtype clustering analysis
* Added more interpretation of subtype analysis results
* Removed repeated measures analysis
* Added description of findings to graphical abstract

## Analysis

* removed individual parkinsonian features from OS model (#106)
* added info about displayed statistics to rows for `compute_prob_correct()` (#56)

## Graphics

* added red reference line at 3 obs per stage in `stage_barplot()` (#91)
* added grayscale legend to PVDs (#83)
* added test for `pvd_lineplot()` (#68)
* added `biomarker_order` argument to `compact_pvd_data_prep()` 
(default behavior should be unchanged)
* added `shared_flextable_settings()` function to apply font, font size, and line spacing to all tables

## Data processing

* added tools for finding journals to submit to (#66)
* renamed `FXTAS Stage (0-5)*` to `FXTAS Stage`
* added columns to pre-processed data:
   - `Male`
   - `CGG 100-199`
   - `CGG 55-99`
* substituted ≤ instead of <= in dichotomized CANTAB variable value labels
* renamed SCID composite vars without capitalization (on Dr. Bourgeois's recommendation)
* added "label" attribute to `FX3*`
* added "Disorder" suffix to SCID composite variables, 
on Dr. Bourgeois's recommendation.
* fixed `create_any_tremor()` to handle NAs before or after `fix_factors()`.
* renamed "Any Autoimmune" to "any autoimmune disorder" and make it "Yes"/"No"
* decapitalized "MMSE Total Score" to "MMSE total score"
* decapitalized "Parkinsonian features" to "parkinsonian features"
* removed "Parkinsonian features: " prefix from:
  - "Masked faces",
  - "Increased tone",
  - "pill-rolling tremor exam",
  - "Stiff gait"
* Renamed "CGG (backfilled)" to CGG
* Renamed "ApoE (backfilled)" to ApoE
* Now using most recent ApoE value

## Package setup

* moved `analyses/` into `inst` (#120)
* removed `veccompare` and `pryr` from `Suggests`; both were archived from CRAN and unused in the package, which broke dependency resolution on all CI jobs (#157)
* dropped the `devtag` roclet (no `@dev` tags were in use; internal functions already use `@keywords internal`) and regenerated `man/` with roxygen2 8.0.0, fixing the `Documentation check` job (#159)
* updated test-coverage.yaml workflow
* updated readme to specify new location of manuscript source code 
in `analyses/`
* updated `WORDLIST`

## Linting

* configured .lintr (#74)

## Testing

- added test for `compile_biomarker_group_list()`

# fxtas 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.

