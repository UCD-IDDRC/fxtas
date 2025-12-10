expand_MCP <- function(x) {
  x |>
    stringr::str_replace("^MCP ", "Middle cerebellar peduncle (MCP): ")
}
