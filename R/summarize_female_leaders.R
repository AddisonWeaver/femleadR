#' Summarize Top Countries by Years of Female Leadership
#'
#' Returns a summary table of the top countries with the most years of
#' female national leadership, along with their average GDP.
#'
#' @param data A data frame from \code{load_gdp_data()}.
#' @param n Number of top countries to return. Default is 10.
#'
#' @return A tibble with columns: country_name, country_code,
#'   years_with_female_leader, avg_gdp.
#' @importFrom dplyr filter group_by summarize slice_max
#' @export
summarize_female_leaders <- function(data, n = 10) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  if (!is.numeric(n) || n < 1) stop("`n` must be a positive integer.")

  data |>
    dplyr::filter(!is.na(gdp)) |>
    dplyr::group_by(country_name, country_code) |>
    dplyr::summarize(
      years_with_female_leader = sum(female_leader, na.rm = TRUE),
      avg_gdp = mean(gdp, na.rm = TRUE),
      .groups = "drop"
    ) |>
    dplyr::slice_max(years_with_female_leader, n = n, with_ties = FALSE)
}
