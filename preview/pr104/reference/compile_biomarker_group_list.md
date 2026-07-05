# Compile a list of biomarker groups

This function compiles a [list](https://rdrr.io/r/base/list.html) of
biomarker variable names, grouped into categories. Some of the
categories are hard-coded, while others are extracted from the column
names of the input [data.frame](https://rdrr.io/r/base/data.frame.html)
`dataset` using regular expressions (see
[base::regex](https://rdrr.io/r/base/regex.html) and
[`base::grep()`](https://rdrr.io/r/base/grep.html)).

## Usage

``` r
compile_biomarker_group_list(dataset)
```

## Arguments

- dataset:

  Dataset to extract biomarker names from using regular expressions

## Value

a [list](https://rdrr.io/r/base/list.html) of
[character](https://rdrr.io/r/base/character.html) vectors, with the
list names denoting biomarker groups and the elements of the
[character](https://rdrr.io/r/base/character.html) vectors denoting
individual biomarkers in each group.

## Examples

``` r
compile_biomarker_group_list(dataset = test_data_v1)
```
