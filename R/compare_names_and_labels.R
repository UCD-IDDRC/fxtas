compare_names_and_labels <- function(names, labels) {
  if(!isTRUE(setequal(names, names(labels)))) {

    cli::cli_warn(
      c("missing from labels:",
        setdiff(names, names(labels))))
    # print(setdiff(names, names(labels)))

    cli::cli_warn(c("missing from names:", setdiff(names(labels), names)))
    browser(message("why is there a mismatch?"))
  }
}
