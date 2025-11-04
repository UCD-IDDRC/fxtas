# Make demographics table

Make demographics table

## Usage

``` r
make_demographics_table(
  data,
  strata = "Gender",
  vars = c("Age at visit", "Primary Race/Ethnicity", "FXTAS Stage", "CGG")
)
```

## Arguments

- data:

  a [data.frame](https://rdrr.io/r/base/data.frame.html) containing the
  variables specified by `strata` and `vars`

- strata:

  names of column variable, specified as
  [character](https://rdrr.io/r/base/character.html)

- vars:

  names of row variables, specified as
  [character](https://rdrr.io/r/base/character.html)

## Value

a
[flextable::flextable](https://davidgohel.github.io/flextable/reference/flextable.html)

## Examples

``` r
test_data_v1 |> make_demographics_table()
#> 5 missing rows in the "FX*" column have been removed.
#> 2 missing rows in the "FX*" column have been removed.


.cl-1209bc0e{}.cl-120210d0{font-family:'Gill sans MT';font-size:8pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-120210ee{font-family:'Gill sans MT';font-size:4.8pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;position: relative;bottom:2.4pt;}.cl-120210f8{font-family:'Gill sans MT';font-size:8pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-12021102{font-family:'Gill sans MT';font-size:4.8pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;position: relative;bottom:2.4pt;}.cl-12053256{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-1205326a{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-1205326b{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-12053274{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-1205327e{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:15pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-120553b2{width:2.025in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553bc{width:1.328in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553c6{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553c7{width:0.925in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553c8{width:2.025in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553d0{width:1.328in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553d1{width:1.23in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553da{width:0.925in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553db{width:2.025in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553dc{width:1.328in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553e4{width:1.23in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553e5{width:0.925in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553ee{width:2.025in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553ef{width:1.328in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553f8{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-120553f9{width:0.925in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}



 
```

Male

Female

M vs. F  
(all CGG combined)

Characteristic

CGG \<55   
N = 431

CGG ≥ 55   
N = 2051

CGG \<55   
N = 131

CGG ≥ 55   
N = 451

p-value2

Age at visit

0.8483

Mean (SD)

62.3 (10.64)

62.6 (10.25)

65.3 (9.40)

62.4 (12.01)

Median \[Min, Max\]

62 \[41, 85\]

63 \[40, 92\]

68 \[48, 80\]

63 \[41, 89\]

Missing

0

1

Primary Race/Ethnicity

1.0004

White

31 (82%)

168 (90%)

13 (100%)

37 (84%)

Hispanic

3 (7.9%)

7 (3.8%)

0 (0%)

3 (6.8%)

Black

0 (0%)

3 (1.6%)

0 (0%)

1 (2.3%)

Other

4 (11%)

8 (4.3%)

0 (0%)

3 (6.8%)

Missing

5

19

0

1

FXTAS Stage

0.4794

0

13 (34%)

72 (39%)

3 (27%)

11 (26%)

1

5 (13%)

27 (14%)

3 (27%)

5 (12%)

2

9 (24%)

35 (19%)

1 (9.1%)

11 (26%)

3

8 (21%)

40 (21%)

3 (27%)

10 (23%)

4

2 (5.3%)

11 (5.9%)

1 (9.1%)

5 (12%)

5

1 (2.6%)

2 (1.1%)

0 (0%)

1 (2.3%)

Missing

5

18

2

2

CGG

0.3953

Mean (SD)

89.1 (111.77)

80.5 (60.21)

80.6 (36.05)

82.5 (115.49)

Median \[Min, Max\]

77 \[20, 780\]

79 \[20, 845\]

85 \[28, 141\]

69 \[20, 800\]

Missing

0

2

0

1

1n (%)

2p-values represent tests for sex differences in distributions of
characteristics, all CGG repeat levels.

3p-value for significance of sex difference by Wilcoxon rank sum test

4p-value for significance of sex difference by Fisher's exact test
