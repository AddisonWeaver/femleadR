#' Filter data by year range
#'
#' A helper function used internally to filter a dataset to a
#' specified year range.
#'
#' @param data A data frame containing a \code{year} column.
#' @param min_year Minimum year to keep. Default is NULL (no lower bound).
#' @param max_year Maximum year to keep. Default is NULL (no upper bound).
#'
#' @return A filtered data frame.
#' @importFrom dplyr filter
#' @keywords internal
filter_years <- function(data, min_year = NULL, max_year = NULL) {
  if (!is.null(min_year)) {
    if (!is.numeric(min_year)) stop("`min_year` must be numeric.")
    data <- dplyr::filter(data, year >= min_year)
  }
  if (!is.null(max_year)) {
    if (!is.numeric(max_year)) stop("`max_year` must be numeric.")
    data <- dplyr::filter(data, year <= max_year)
  }
  data
}
