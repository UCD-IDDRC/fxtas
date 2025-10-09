colorbar_title <- function(level, type = "level") {
  if (type == "level") {
    to_return <- paste("Level", level)
  } else if (type == "subscript") {
    to_return <- glue::glue("Pr(Stage)<sub>{level}</sub>")
  } else cli::cli_abort("not implemented yet.")
  return(to_return)
}
