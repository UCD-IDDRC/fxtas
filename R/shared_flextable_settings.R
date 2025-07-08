#' Apply flextable settings to match Brain journal requirements
#'
#' @param x a [flextable::flextable]
#' @param padding
#' controls `padding.top` and `padding.bottom` in [flextable::padding()]
#' @returns a modified [flextable::flextable]
#' @export
#' @examples
#' head(iris) |> flextable::flextable() |> shared_flextable_settings()
#'
shared_flextable_settings = function(x, padding = 0) {
  x |>
    flextable::padding(padding.top = padding,
                       padding.bottom = padding,
                       part = "all") |>
    flextable::fontsize(size = 8, part = "all") |>
    flextable::font(fontname = "Gill sans MT", part = 'all') |>
    flextable::height_all(height = 0.45, part = "all", unit = "cm") |>
    flextable::bold(part = "header")

}
