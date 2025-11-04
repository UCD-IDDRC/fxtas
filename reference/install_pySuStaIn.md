# Install the `pySuStaIn` python package from github

This function is a wrapper for
[reticulate::conda_install](https://rstudio.github.io/reticulate/reference/conda-tools.html).
Its implementation follows the instructions in:

- https://rstudio.github.io/reticulate/articles/package.html

- https://rstudio.github.io/reticulate/articles/python_dependencies.html

## Usage

``` r
install_pySuStaIn(
  envname = "r-pySuStaIn",
  python_version = "<3.10",
  method = "auto",
  pip = TRUE,
  ...
)
```

## Arguments

- envname:

  The name, or full path, of the environment in which Python packages
  are to be installed. When `NULL` (the default), the active environment
  as set by the `RETICULATE_PYTHON_ENV` variable will be used; if that
  is unset, then the `r-reticulate` environment will be used.

- python_version:

  The requested Python version. Ignored when attempting to install with
  a Python virtual environment.

- method:

  Installation method. By default, "auto" automatically finds a method
  that will work in the local environment. Change the default to force a
  specific installation method. Note that the "virtualenv" method is not
  available on Windows.

- pip:

  Boolean; use `pip` for package installation? This is only relevant
  when Conda environments are used, as otherwise packages will be
  installed from the Conda repositories.

- ...:

  Arguments passed on to
  [`reticulate::py_install`](https://rstudio.github.io/reticulate/reference/py_install.html)

  `packages`

  :   A vector of Python packages to install.

  `conda`

  :   The path to a `conda` executable. Use `"auto"` to allow
      `reticulate` to automatically find an appropriate `conda` binary.
      See **Finding Conda** and
      [`conda_binary()`](https://rstudio.github.io/reticulate/reference/conda-tools.html)
      for more details.

  `pip_ignore_installed,ignore_installed`

  :   Boolean; whether pip should ignore previously installed versions
      of the requested packages. Setting this to `TRUE` causes pip to
      install the latest versions of all dependencies into the requested
      environment. This ensure that no dependencies are satisfied by a
      package that exists either in the site library or was previously
      installed from a different–potentially incompatible–distribution
      channel. (`ignore_installed` is an alias for
      `pip_ignore_installed`, `pip_ignore_installed` takes precedence).

## Details

### `python_version`

`pySuStaIn` and its dependency `kde_ebm` currently (2024-02-14) do not
appear to be with python \>= 3.10.

### `pip`

`pip = TRUE` appears to be necessary, since `pySuStaIn` needs to be
installed directly from \<github.com\>
