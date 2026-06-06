#' Load the democracy and GDP dataset
#'
#' Loads the merged democracy and GDP dataset bundled with the package.
#'
#' @return A tibble containing democracy and GDP data.
#' @importFrom readr read_csv
#' @export
load_gdp_data <- function() {
  path <- system.file("extdata", "democracy_and_gdp.csv", package = "femleadR")
  if (path == "") stop("Data file not found. Try reinstalling the package.")
  readr::read_csv(path, show_col_types = FALSE)
}
