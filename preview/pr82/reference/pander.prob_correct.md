# Print `prob_correct` objects as Pandoc markdown tables

This function is a method of the
[`pander::pander()`](https://rdrr.io/pkg/pander/man/pander.html)
function from the `pander` package, for `prob_correct` objects (from
[`compute_prob_correct()`](https://UCD-IDDRC.github.io/fxtas/preview/pr82/reference/compute_prob_correct.md)).
It prints `prob_correct` objects as Pandoc markdown tables.

## Usage

``` r
# S3 method for class 'prob_correct'
pander(x, ...)
```

## Arguments

- x:

  a `prob_correct` object (from
  [`compute_prob_correct()`](https://UCD-IDDRC.github.io/fxtas/preview/pr82/reference/compute_prob_correct.md))

- ...:

  currently unused

## Value

By default this function outputs (see: `cat`) the result. If you would
want to catch the result instead, then call the function ending in
`.return`.

## Examples

``` r
full_data <- test_data_v1
v1_usable <- full_data |> dplyr::filter(CGG < 200)

biomarker_groups <- compile_biomarker_groups_table(
   dataset = v1_usable)

biomarker_varnames <-
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels <-
  v1_usable |>
  get_levels(biomarker_varnames)

control_data <-
  v1_usable |>
  dplyr::filter(`FX*` == "CGG <55") |>
  dplyr::select(all_of(biomarker_varnames))

control_data |>
  compute_prob_correct(
    max_prob = .95,
    biomarker_levels = biomarker_levels
  ) |>
  attr("data") |>
  pander::pander()
#> 
#> -----------------------------------------------------------------------
#>             Symptom               # controls with data   # at baseline 
#> -------------------------------- ---------------------- ---------------
#>           Head tremor                      22                 21       
#> 
#>         Intention tremor                   37                 18       
#> 
#>          Resting tremor                    45                 38       
#> 
#>         Postural tremor                    39                 27       
#> 
#>       Intermittent tremor                  44                 33       
#> 
#>              Ataxia                        39                 17       
#> 
#>        Ataxia: severity*                   45                 36       
#> 
#>           FXTAS Stage                      48                 16       
#> 
#>      parkinsonian features                 21                 18       
#> 
#>           Masked faces                     43                 40       
#> 
#>          Increased tone                    31                 27       
#> 
#>       Pill-rolling tremor                  30                 29       
#> 
#>            Stiff gait                      30                 26       
#> 
#>            Parkinsons                      13                 12       
#> 
#>         MRI: Cerebellar                    22                  3       
#> 
#>          MRI: Cerebral                     19                  0       
#> 
#>         Splenium (CC)-WM                   23                  5       
#>          Hyperintensity                                                
#> 
#>   Genu (CC)-WM Hyperintensity              15                  7       
#> 
#>    Corpus Callosum-Thickness               17                  7       
#> 
#>        MMSE total score*                   17                 14       
#> 
#>        BDS-2 Total Score*                  48                 37       
#> 
#>       SCID: mood disorders                 26                 16       
#> 
#>  SCID: substance use disorders             18                 16       
#> 
#>     SCID: anxiety disorders                30                  9       
#> 
#>    SCID: somatoform disorders              24                 24       
#> 
#>       SWM Between errors*                  33                 22       
#> 
#>   PAL Total errors (adjusted)*             26                 10       
#> 
#>  RTI Five-choice movement time*            28                 19       
#> 
#>           Hypothyroid                      35                 32       
#> 
#>           Hyperthyroid                     36                 34       
#> 
#>     any autoimmune disorder                45                 37       
#> -----------------------------------------------------------------------
#> 
#> Table: Table continues below
#> 
#>  
#> ----------------------------------
#>  % at baseline   Est. Pr(correct) 
#> --------------- ------------------
#>      95.5%             95%        
#> 
#>      48.6%            48.6%       
#> 
#>      84.4%            84.4%       
#> 
#>      69.2%            69.2%       
#> 
#>       75%              75%        
#> 
#>      43.6%            43.6%       
#> 
#>       80%              80%        
#> 
#>      33.3%            33.3%       
#> 
#>      85.7%            85.7%       
#> 
#>       93%              93%        
#> 
#>      87.1%            87.1%       
#> 
#>      96.7%             95%        
#> 
#>      86.7%            86.7%       
#> 
#>      92.3%            92.3%       
#> 
#>      13.6%            13.6%       
#> 
#>       0%                0%        
#> 
#>      21.7%            21.7%       
#> 
#>      46.7%            46.7%       
#> 
#>      41.2%            41.2%       
#> 
#>      82.4%            82.4%       
#> 
#>      77.1%            77.1%       
#> 
#>      61.5%            61.5%       
#> 
#>      88.9%            88.9%       
#> 
#>       30%              30%        
#> 
#>      100%              95%        
#> 
#>      66.7%            66.7%       
#> 
#>      38.5%            38.5%       
#> 
#>      67.9%            67.9%       
#> 
#>      91.4%            91.4%       
#> 
#>      94.4%            94.4%       
#> 
#>      82.2%            82.2%       
#> ----------------------------------
#> 
```
