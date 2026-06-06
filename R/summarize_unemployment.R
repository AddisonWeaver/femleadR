#' Summarize Unemployment by Regime Type
#'
#' Returns a summary table of average unemployment rates by regime type
#' for a given year.
#'
#' @param data A data frame from \code{load_unemployment_data()}.
#' @param year_filter A single year to filter by (1950-2020). Default is 2019.
#'
#' @return A tibble with columns: regime_category, number_of_countries,
#'   avg_unemployment, above_10_percent, percent_above_10.
#' @importFrom dplyr filter distinct group_by summarize n_distinct arrange desc
#' @export
summarize_unemployment <- function(data, year_filter = 2019) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  if (!is.numeric(year_filter)) stop("`year_filter` must be a numeric year (e.g. 2019).")
  if (year_filter < 1950 || year_filter > 2020) stop("`year_filter` must be between 1950 and 2020.")

  data |>
    dplyr::filter(year == year_filter) |>
    dplyr::distinct(country_name, regime_category, .keep_all = TRUE) |>
    dplyr::group_by(regime_category) |>
    dplyr::summarize(
      number_of_countries = dplyr::n_distinct(country_name),
      avg_unemployment    = mean(unemployment_rate, na.rm = TRUE),
      above_10_percent    = sum(unemployment_rate > 10, na.rm = TRUE),
      percent_above_10    = above_10_percent / number_of_countries,
      .groups = "drop"
    ) |>
    dplyr::arrange(dplyr::desc(percent_above_10))
}
