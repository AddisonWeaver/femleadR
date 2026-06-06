#' Plot Unemployment Rates by Regime Type
#'
#' Creates a boxplot of unemployment rates across political regime types
#' for a given year.
#'
#' @param data A data frame from \code{load_unemployment_data()}.
#' @param year_filter A single year to filter by (1950-2020). Default is 2019.
#'
#' @return A ggplot object.
#' @importFrom dplyr filter distinct
#' @importFrom ggplot2 ggplot aes geom_boxplot labs theme_minimal theme element_text
#' @export
plot_unemployment <- function(data, year_filter = 2019) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  if (!is.numeric(year_filter)) stop("`year_filter` must be a numeric year (e.g. 2019).")
  if (year_filter < 1950 || year_filter > 2020) stop("`year_filter` must be between 1950 and 2020.")

  data |>
    dplyr::filter(year == year_filter) |>
    dplyr::distinct(country_name, regime_category, .keep_all = TRUE) |>
    ggplot2::ggplot(ggplot2::aes(x = regime_category, y = unemployment_rate)) +
    ggplot2::geom_boxplot(fill = "#76B7B2", alpha = 0.7) +
    ggplot2::labs(
      title    = paste("Unemployment Rates by Regime Type (", year_filter, ")"),
      subtitle = "Distribution of unemployment rates by regime category",
      x        = "Regime Type",
      y        = "Unemployment Rate (%)"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      plot.title  = ggplot2::element_text(face = "bold"),
      axis.text.x = ggplot2::element_text(angle = 45, hjust = 1)
    )
}
