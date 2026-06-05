#' Filter data by year range
#'
#' A helper function used internally to filter a dataset to a
#' specified year range.
#'
#' @param data A data frame containing a \code{year} column.
#' @param min_year Minimum year to keep (1950–2020). Default is NULL (no lower bound).
#' @param max_year Maximum year to keep (1950–2020). Default is NULL (no upper bound).
#'
#' @return A filtered data frame.
#' @importFrom dplyr filter
#' @keywords internal
filter_years <- function(data, min_year = NULL, max_year = NULL) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  if (!"year" %in% names(data)) stop("`data` must contain a `year` column.")
  if (!is.null(min_year)) {
    if (!is.numeric(min_year)) stop("`min_year` must be a numeric year (e.g. 1990).")
    if (min_year < 1950 || min_year > 2020) stop("`min_year` must be between 1950 and 2020.")
  }
  if (!is.null(max_year)) {
    if (!is.numeric(max_year)) stop("`max_year` must be a numeric year (e.g. 2010).")
    if (max_year < 1950 || max_year > 2020) stop("`max_year` must be between 1950 and 2020.")
  }
  if (!is.null(min_year) && !is.null(max_year) && min_year > max_year) {
    stop("`min_year` must be less than or equal to `max_year`.")
  }
  if (!is.null(min_year)) data <- dplyr::filter(data, year >= min_year)
  if (!is.null(max_year)) data <- dplyr::filter(data, year <= max_year)
  data
}
