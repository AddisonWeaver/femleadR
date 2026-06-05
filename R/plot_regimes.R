#' Plot Monarchies vs Democracies Over Time
#'
#' Creates a line plot comparing the number of monarchies
#' and democracies over time.
#'
#' @param data A dataframe from \code{load_data()}
#' @param min_year Minimum year to include (1950–2020). Default is NULL (no lower bound).
#' @param max_year Maximum year to include (1950–2020). Default is NULL (no upper bound).
#'
#' @return A ggplot object
#' @importFrom dplyr filter group_by summarize
#' @importFrom tidyr pivot_longer
#' @importFrom ggplot2 ggplot aes geom_line labs
#' @export
#'
#' @examples
#' \donttest{
#'   dat <- load_data()
#'   plot_regimes(dat)
#'   plot_regimes(dat, min_year = 1990)
#'   plot_regimes(dat, min_year = 1990, max_year = 2010)
#' }
plot_regimes <- function(data, min_year = NULL, max_year = NULL) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  data <- filter_years(data, min_year = min_year, max_year = max_year)
  data |>
    dplyr::group_by(year) |>
    dplyr::summarize(
      monarchies = sum(is_monarchy, na.rm = TRUE),
      democracies = sum(is_democracy, na.rm = TRUE),
      .groups = "drop"
    ) |>
    tidyr::pivot_longer(cols = c(monarchies, democracies),
                        names_to = "type",
                        values_to = "count") |>
    ggplot2::ggplot(ggplot2::aes(x = year, y = count, color = type)) +
    ggplot2::geom_line() +
    ggplot2::labs(
      title = "Monarchies vs Democracies Over Time",
      x = "Year",
      y = "Count",
      color = "Regime Type"
    )
}
