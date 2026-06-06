#' Load the democracy and unemployment dataset
#'
#' Loads the merged democracy and unemployment dataset bundled with the package.
#'
#' @return A tibble containing democracy and unemployment data.
#' @importFrom readr read_csv
#' @export
load_unemployment_data <- function() {
  path <- system.file("extdata", "democracy_and_unemploy.csv", package = "femleadR")
  if (path == "") stop("Data file not found. Try reinstalling the package.")
  readr::read_csv(path, show_col_types = FALSE)
}
