# Print `prob_correct` objects as Pandoc markdown tables

This function is a method of the
[`pander::pander()`](https://rdrr.io/pkg/pander/man/pander.html)
function from the `pander` package, for `prob_correct` objects (from
[`compute_prob_correct()`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/compute_prob_correct.md)).
It prints `prob_correct` objects as Pandoc markdown tables.

## Usage

``` r
# S3 method for class 'prob_correct'
pander(x, ...)
```

## Arguments

- x:

  a `prob_correct` object (from
  [`compute_prob_correct()`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/compute_prob_correct.md))

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
#>           head tremor                      28                 19       
#> 
#>         intention tremor                   53                 26       
#> 
#>          resting tremor                    47                 35       
#> 
#>         postural tremor                    47                 23       
#> 
#>       intermittent tremor                  34                 23       
#> 
#>           Tandem Walk                      22                 11       
#> 
#>         ataxia severity*                   53                 34       
#> 
#>           FXTAS Stage                      53                 19       
#> 
#>      parkinsonian features                 21                 18       
#> 
#>           Masked faces                     44                 42       
#> 
#>          Increased tone                    26                 25       
#> 
#>       pill-rolling tremor                  34                 34       
#> 
#>            Stiff gait                      26                 24       
#> 
#>            Parkinsons                      10                  7       
#> 
#>      MCP-WM Hyperintensity                 24                 19       
#> 
#>         MRI: Cerebellar                    16                 11       
#> 
#>          MRI: Cerebral                     20                  2       
#> 
#>         Splenium (CC)-WM                   17                  3       
#>          Hyperintensity                                                
#> 
#>   Genu (CC)-WM Hyperintensity              16                  9       
#> 
#>    Corpus Callosum-Thickness               15                  8       
#> 
#>        MMSE total score*                   25                 22       
#> 
#>        BDS-2 Total Score*                  52                 45       
#> 
#>       SCID: mood disorders                 30                 16       
#> 
#>  SCID: substance use disorders             24                 18       
#> 
#>     SCID: anxiety disorders                32                 13       
#> 
#>    SCID: somatoform disorders              25                 24       
#> 
#>       SWM Between errors*                  34                 23       
#> 
#>   PAL Total errors (adjusted)*             40                 15       
#> 
#>  RTI Five-choice movement time*            37                 25       
#> 
#>           Hypothyroid                      42                 38       
#> 
#>           Hyperthyroid                     29                 28       
#> 
#>     any autoimmune disorder                48                 43       
#> -----------------------------------------------------------------------
#> 
#> Table: Table continues below
#> 
#>  
#> ----------------------------------
#>  % at baseline   Est. Pr(correct) 
#> --------------- ------------------
#>      67.9%            67.9%       
#> 
#>      49.1%            49.1%       
#> 
#>      74.5%            74.5%       
#> 
#>      48.9%            48.9%       
#> 
#>      67.6%            67.6%       
#> 
#>       50%              50%        
#> 
#>      64.2%            64.2%       
#> 
#>      35.8%            35.8%       
#> 
#>      85.7%            85.7%       
#> 
#>      95.5%             95%        
#> 
#>      96.2%             95%        
#> 
#>      100%              95%        
#> 
#>      92.3%            92.3%       
#> 
#>       70%              70%        
#> 
#>      79.2%            79.2%       
#> 
#>      68.8%            68.8%       
#> 
#>       10%              10%        
#> 
#>      17.6%            17.6%       
#> 
#>      56.2%            56.2%       
#> 
#>      53.3%            53.3%       
#> 
#>       88%              88%        
#> 
#>      86.5%            86.5%       
#> 
#>      53.3%            53.3%       
#> 
#>       75%              75%        
#> 
#>      40.6%            40.6%       
#> 
#>       96%              95%        
#> 
#>      67.6%            67.6%       
#> 
#>      37.5%            37.5%       
#> 
#>      67.6%            67.6%       
#> 
#>      90.5%            90.5%       
#> 
#>      96.6%             95%        
#> 
#>      89.6%            89.6%       
#> ----------------------------------
#> 
```
