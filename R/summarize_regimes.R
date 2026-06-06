#' Summarize Regime Types by Year
#'
#' Returns a summary table counting the number of each
#' regime type per year. Uses \code{data.table} for efficient aggregation.
#'
#' @param data A data frame from \code{load_data()}.
#' @param min_year Minimum year to filter by (1950–2020). Default is NULL (no lower bound).
#' @param max_year Maximum year to filter by (1950–2020). Default is NULL (no upper bound).
#'
#' @return A tibble with columns: year, regime_category, count.
#' @importFrom data.table as.data.table .N
#' @importFrom tibble as_tibble
#' @export
summarize_regimes <- function(data, min_year = NULL, max_year = NULL) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")

  data <- filter_years(data, min_year = min_year, max_year = max_year)

  dt <- data.table::as.data.table(data)
  result <- dt[, .(count = .N), by = .(year, regime_category)]
  tibble::as_tibble(result)
}
