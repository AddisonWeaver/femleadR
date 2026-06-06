#' Plot Top Countries by Years of Female Leadership
#'
#' Creates a bar plot showing the top countries with the most years of
#' female national leadership.
#'
#' @param data A data frame from \code{load_gdp_data()}.
#' @param n Number of top countries to display. Default is 10.
#'
#' @return A ggplot object.
#' @importFrom dplyr filter group_by summarize slice_max
#' @importFrom ggplot2 ggplot aes geom_col labs theme_minimal theme element_text
#' @importFrom stats reorder
#' @export
plot_female_leaders <- function(data, n = 10) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  if (!is.numeric(n) || n < 1) stop("`n` must be a positive integer.")

  summary <- summarize_female_leaders(data, n = n)

  ggplot2::ggplot(summary,
                  ggplot2::aes(x = years_with_female_leader,
                               y = reorder(country_name, years_with_female_leader))) +
    ggplot2::geom_col(fill = "#4E79A7") +
    ggplot2::labs(
      title = paste("Top", n, "Countries by Years of Female National Leadership"),
      x = "Years with Female Leader",
      y = "Country"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(plot.title = ggplot2::element_text(face = "bold"))
}
