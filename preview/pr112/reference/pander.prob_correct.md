# Print `prob_correct` objects as Pandoc markdown tables

This function is a method of the
[`pander::pander()`](https://rdrr.io/pkg/pander/man/pander.html)
function from the `pander` package, for `prob_correct` objects (from
[`compute_prob_correct()`](https://UCD-IDDRC.github.io/fxtas/preview/pr112/reference/compute_prob_correct.md)).
It prints `prob_correct` objects as Pandoc markdown tables.

## Usage

``` r
# S3 method for class 'prob_correct'
pander(x, ...)
```

## Arguments

- x:

  a `prob_correct` object (from
  [`compute_prob_correct()`](https://UCD-IDDRC.github.io/fxtas/preview/pr112/reference/compute_prob_correct.md))

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
#>           head tremor                      22                 15       
#> 
#>         intention tremor                   46                 20       
#> 
#>          resting tremor                    52                 47       
#> 
#>         postural tremor                    50                 35       
#> 
#>       intermittent tremor                  45                 30       
#> 
#>           Tandem Walk                      25                 11       
#> 
#>         ataxia severity*                   52                 38       
#> 
#>           FXTAS Stage                      52                 18       
#> 
#>      parkinsonian features                 42                 33       
#> 
#>            Parkinsons                      12                 12       
#> 
#>      MCP-WM Hyperintensity                 21                 12       
#> 
#>         MRI: Cerebellar                    18                  9       
#> 
#>          MRI: Cerebral                     27                  5       
#> 
#>         Splenium (CC)-WM                   8                   1       
#>          Hyperintensity                                                
#> 
#>   Genu (CC)-WM Hyperintensity              16                 11       
#> 
#>    Corpus Callosum-Thickness               22                 12       
#> 
#>        MMSE total score*                   23                 20       
#> 
#>        BDS-2 Total Score*                  50                 40       
#> 
#>       SCID: mood disorders                 26                 13       
#> 
#>  SCID: substance use disorders             35                 28       
#> 
#>     SCID: anxiety disorders                28                 13       
#> 
#>    SCID: somatoform disorders              19                 19       
#> 
#>       SWM Between errors*                  31                 24       
#> 
#>   PAL Total errors (adjusted)*             27                 11       
#> 
#>  RTI Five-choice movement time*            39                 27       
#> 
#>           Hypothyroid                      44                 38       
#> 
#>           Hyperthyroid                     38                 37       
#> 
#>     any autoimmune disorder                46                 40       
#> -----------------------------------------------------------------------
#> 
#> Table: Table continues below
#> 
#>  
#> ----------------------------------
#>  % at baseline   Est. Pr(correct) 
#> --------------- ------------------
#>      68.2%            68.2%       
#> 
#>      43.5%            43.5%       
#> 
#>      90.4%            90.4%       
#> 
#>       70%              70%        
#> 
#>      66.7%            66.7%       
#> 
#>       44%              44%        
#> 
#>      73.1%            73.1%       
#> 
#>      34.6%            34.6%       
#> 
#>      78.6%            78.6%       
#> 
#>      100%              95%        
#> 
#>      57.1%            57.1%       
#> 
#>       50%              50%        
#> 
#>      18.5%            18.5%       
#> 
#>      12.5%            12.5%       
#> 
#>      68.8%            68.8%       
#> 
#>      54.5%            54.5%       
#> 
#>       87%              87%        
#> 
#>       80%              80%        
#> 
#>       50%              50%        
#> 
#>       80%              80%        
#> 
#>      46.4%            46.4%       
#> 
#>      100%              95%        
#> 
#>      77.4%            77.4%       
#> 
#>      40.7%            40.7%       
#> 
#>      69.2%            69.2%       
#> 
#>      86.4%            86.4%       
#> 
#>      97.4%             95%        
#> 
#>       87%              87%        
#> ----------------------------------
#> 
```
