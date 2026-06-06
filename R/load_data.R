#' Load the female leadership dataset
#'
#' Loads the democracy and female leadership dataset bundled with the package.
#'
#' @return A tibble containing the female leadership data.
#' @importFrom readr read_csv
#' @export
load_data <- function() {
  path <- system.file("extdata", "democracy_data.csv", package = "femleadR")
  if (path == "") stop("Data file not found. Try reinstalling the package.")
  readr::read_csv(path, show_col_types = FALSE)
}
