#' Summarize Regime Types by Year
#'
#' Returns a summary table counting the number of each
#' regime type per year.
#'
#' @param data A dataframe from \code{load_data()}
#' @param min_year Minimum year to filter by (1950–2020). Default is NULL (no lower bound).
#' @param max_year Maximum year to filter by (1950–2020). Default is NULL (no upper bound).
#'
#' @return A tibble with columns: year, regime_category, count
#' @importFrom dplyr filter group_by summarize n
#' @export
summarize_regimes <- function(data, min_year = NULL, max_year = NULL) {

  if (!is.data.frame(data)) stop("`data` must be a data frame.")

  data <- filter_years(data, min_year = min_year, max_year = max_year)

  data |>
    dplyr::group_by(year, regime_category) |>
    dplyr::summarize(count = dplyr::n(), .groups = "drop")
}
