# Construct biomarker events table

Construct biomarker events table

## Usage

``` r
make_biomarker_events_table(biomarker_levels, biomarker_groups)
```

## Arguments

- biomarker_levels:

  todo

- biomarker_groups:

  todo

## Value

a
[tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)

## Examples

``` r
biomarker_groups <- compile_biomarker_groups_table(
  dataset = test_data_v1
)

biomarker_varnames <-
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels <-
  test_data_v1 |>
  get_levels(biomarker_varnames)

make_biomarker_events_table(
  biomarker_levels,
  biomarker_groups
)
#> # A tibble: 49 × 9
#>    biomarker          biomarker_label biomarker_label_long level biomarker_level
#>    <chr+lbl>          <chr>           <chr>                <int> <chr+lbl>      
#>  1 Tandem Walk [tand… tandem walk     tandem walk              2 Tandem W… [tan…
#>  2 Tandem Walk [tand… tandem walk     tandem walk              3 Tandem W… [tan…
#>  3 ataxia seve… [ata… ataxia severity ataxia severity          2 ataxia s… [ata…
#>  4 ataxia seve… [ata… ataxia severity ataxia severity          3 ataxia s… [ata…
#>  5 ataxia seve… [ata… ataxia severity ataxia severity          4 ataxia s… [ata…
#>  6 ataxia seve… [ata… ataxia severity ataxia severity          5 ataxia s… [ata…
#>  7 PAL Total e… [PAL… PAL total erro… Paired Associates L…     2 PAL Tota… [PAL…
#>  8 RTI Five-ch… [RTI… RTI five-choic… Reaction Time (RTI)…     2 RTI Five… [RTI…
#>  9 SWM Between… [SWM… SWM between er… Spatial Working Mem…     2 SWM Betw… [SWM…
#> 10 Corpus Call… [Cor… Corpus Callosu… Corpus Callosum-Thi…     2 Corpus C… [Cor…
#> # ℹ 39 more rows
#> # ℹ 4 more variables: level_labelled <chr>, levels <chr>,
#> #   biomarker_group <chr>, group_color <chr>
```
