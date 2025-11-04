# Make demographics table

Make demographics table

## Usage

``` r
make_demographics_table(
  data,
  strata = "Gender",
  vars = c("Age at visit", "Primary Race/Ethnicity", "FXTAS Stage", "CGG"),
  make_ft = TRUE,
  ...
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

- make_ft:

  [logical](https://rdrr.io/r/base/logical.html) whether to convert to
  flextable

- ...:

  Arguments passed on to
  [`format_demographics_table_as_flextable`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/format_demographics_table_as_flextable.md)

  :   

## Value

a
[flextable::flextable](https://davidgohel.github.io/flextable/reference/flextable.html)

## Examples

``` r
test_data_v1 |> make_demographics_table()
#> 2 missing rows in the "FX*" column have been removed.
#> 1 missing rows in the "FX*" column have been removed.


.cl-825fab74{}.cl-82587548{font-family:'Gill sans MT';font-size:8pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-82587570{font-family:'Gill sans MT';font-size:4.8pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;position: relative;bottom:2.4pt;}.cl-8258757a{font-family:'Gill sans MT';font-size:8pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-82587584{font-family:'Gill sans MT';font-size:4.8pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;position: relative;bottom:2.4pt;}.cl-825b5416{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-825b542a{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-825b5434{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-825b5435{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-825b5448{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:0;padding-top:0;padding-left:15pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-825b743c{width:2.025in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7446{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7447{width:1.328in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7450{width:0.925in;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7451{width:2.025in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7452{width:1.23in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b745a{width:1.328in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b745b{width:0.925in;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7464{width:2.025in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7465{width:1.23in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b746e{width:1.328in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b746f{width:0.925in;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7470{width:2.025in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7478{width:1.23in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7479{width:1.328in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-825b7482{width:0.925in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}



 
```

Male

Female

M vs. F  
(all CGG combined)

Characteristic

CGG \<55   
N = 491

CGG ≥ 55   
N = 1931

CGG \<55   
N = 101

CGG ≥ 55   
N = 571

p-value2

Age at visit

0.6353

Mean (SD)

64.6 (9.75)

62.8 (9.61)

57.8 (10.62)

64.2 (10.29)

Median \[Min, Max\]

64 \[45, 86\]

63 \[40, 87\]

58 \[41, 74\]

64 \[40, 85\]

Missing

0

1

Primary Race/Ethnicity

0.1804

White

40 (95%)

156 (89%)

10 (100%)

50 (96%)

Hispanic

2 (4.8%)

11 (6.3%)

0 (0%)

0 (0%)

Black

0 (0%)

2 (1.1%)

0 (0%)

0 (0%)

Other

0 (0%)

7 (4.0%)

0 (0%)

2 (3.8%)

Missing

7

17

0

5

FXTAS Stage

0.8494

0

18 (41%)

61 (34%)

1 (11%)

24 (45%)

1

4 (9.1%)

21 (12%)

2 (22%)

6 (11%)

2

7 (16%)

40 (22%)

2 (22%)

9 (17%)

3

12 (27%)

36 (20%)

2 (22%)

8 (15%)

4

2 (4.5%)

15 (8.4%)

2 (22%)

5 (9.4%)

5

1 (2.3%)

5 (2.8%)

0 (0%)

1 (1.9%)

Missing

5

15

1

4

CGG

0.8513

Mean (SD)

72.7 (33.04)

75.5 (27.98)

55.4 (25.14)

88.7 (100.30)

Median \[Min, Max\]

77 \[20, 141\]

79 \[20, 185\]

56 \[29, 94\]

85 \[20, 780\]

Missing

0

3

0

2

1n (%)

2p-values represent tests for sex differences in distributions of
characteristics, all CGG repeat levels.

3p-value for significance of sex difference by Wilcoxon rank sum test

4p-value for significance of sex difference by Fisher's exact test
