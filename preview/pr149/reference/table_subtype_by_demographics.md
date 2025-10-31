# Create table of demographics statistics by most-likely latent subtype

Create table of demographics statistics by most-likely latent subtype

## Usage

``` r
table_subtype_by_demographics(
  patient_data,
  subtype_and_stage_table,
  sust_data = bind_cols(patient_data, subtype_and_stage_table),
  footnotes_as_letters = FALSE,
  demographic_vars = c("CGG", "CGG 55-99", "Male", "Primary Race/Ethnicity"),
  ...
)
```

## Arguments

- patient_data:

  a [data.frame](https://rdrr.io/r/base/data.frame.html)

- subtype_and_stage_table:

  a [data.frame](https://rdrr.io/r/base/data.frame.html)

- sust_data:

  a [data.frame](https://rdrr.io/r/base/data.frame.html) combining
  `patient_data` and `subtype_and_stage_table` by
  [`cbind()`](https://rdrr.io/r/base/cbind.html)

- footnotes_as_letters:

  [logical](https://rdrr.io/r/base/logical.html) whether to convert
  footnote

- demographic_vars:

  [character](https://rdrr.io/r/base/character.html) varnames to compute
  statistics for symbols to letters (TRUE) instead of numbers (FALSE)

- ...:

  Arguments passed on to
  [`gtsummary::tbl_summary`](https://www.danieldsjoberg.com/gtsummary/reference/tbl_summary.html)

  `data`

  :   (`data.frame`)  
      A data frame.

  `by`

  :   ([`tidy-select`](https://dplyr.tidyverse.org/reference/dplyr_tidy_select.html))  
      A single column from `data`. Summary statistics will be stratified
      by this variable. Default is `NULL`.

  `label`

  :   ([`formula-list-selector`](https://www.danieldsjoberg.com/gtsummary/reference/syntax.html))  
      Used to override default labels in summary table, e.g.
      `list(age = "Age, years")`. The default for each variable is the
      column label attribute, `attr(., 'label')`. If no label has been
      set, the column name is used.

  `statistic`

  :   ([`formula-list-selector`](https://www.danieldsjoberg.com/gtsummary/reference/syntax.html))  
      Specifies summary statistics to display for each variable. The
      default is
      `list(all_continuous() ~ "{median} ({p25}, {p75})", all_categorical() ~ "{n} ({p}%)")`.
      See below for details.

  `digits`

  :   ([`formula-list-selector`](https://www.danieldsjoberg.com/gtsummary/reference/syntax.html))  
      Specifies how summary statistics are rounded. Values may be either
      integer(s) or function(s). If not specified, default formatting is
      assigned via `assign_summary_digits()`. See below for details.

  `type`

  :   ([`formula-list-selector`](https://www.danieldsjoberg.com/gtsummary/reference/syntax.html))  
      Specifies the summary type. Accepted value are
      `c("continuous", "continuous2", "categorical", "dichotomous")`. If
      not specified, default type is assigned via
      `assign_summary_type()`. See below for details.

  `value`

  :   ([`formula-list-selector`](https://www.danieldsjoberg.com/gtsummary/reference/syntax.html))  
      Specifies the level of a variable to display on a single row. The
      gtsummary type selectors, e.g. `all_dichotomous()`, cannot be used
      with this argument. Default is `NULL`. See below for details.

  `missing,missing_text,missing_stat`

  :   Arguments dictating how and if missing values are presented:

      - `missing`: must be one of `c("ifany", "no", "always")`.

      - `missing_text`: string indicating text shown on missing row.
        Default is `"Unknown"`.

      - `missing_stat`: statistic to show on missing row. Default is
        `"{N_miss}"`. Possible values are `N_miss`, `N_obs`,
        `N_nonmiss`, `p_miss`, `p_nonmiss`.

  `sort`

  :   ([`formula-list-selector`](https://www.danieldsjoberg.com/gtsummary/reference/syntax.html))  
      Specifies sorting to perform for categorical variables. Values
      must be one of `c("alphanumeric", "frequency")`. Default is
      `all_categorical(FALSE) ~ "alphanumeric"`.

  `percent`

  :   (`string`)  
      Indicates the type of percentage to return. Must be one of
      `c("column", "row", "cell")`. Default is `"column"`.

      In rarer cases, you may need to define/override the typical
      denominators. In these cases, pass an integer or a data frame.
      Refer to the
      [`?cards::ard_tabulate(denominator)`](https://insightsengineering.github.io/cards/latest-tag/reference/ard_tabulate.html)
      help file for details.

  `include`

  :   ([`tidy-select`](https://dplyr.tidyverse.org/reference/dplyr_tidy_select.html))  
      Variables to include in the summary table. Default is
      [`everything()`](https://tidyselect.r-lib.org/reference/everything.html).

## Value

A
[gtsummary::tbl_summary](https://www.danieldsjoberg.com/gtsummary/reference/tbl_summary.html)

## Examples

``` r
patient_data = sim_data |>
  dplyr::filter(.data$Category == "Patient")
table = sim_subtype_and_stage_table
table_subtype_by_demographics(patient_data, table,
  demographic_vars = "Sex")


  

Characteristic
```

**Overall**  
N = 18¹

**Subtype 1**  
N = 1¹

**Subtype 3**  
N = 17¹

**p-value**

Sex, n (%)

  

  

  

1.000²

    Female

9 (50%)

1 (100%)

8 (47%)

  

    Male

9 (50%)

0 (0%)

9 (53%)

  

¹ n (column %)

² Group comparison was done by Fisher’s exact test
