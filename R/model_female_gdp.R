#' Model the Relationship Between Female Leadership and GDP
#'
#' Fits a linear regression model of log(GDP) on female leadership status.
#'
#' @param data A data frame from \code{load_gdp_data()}.
#'
#' @return A linear model object.
#' @importFrom stats lm
#' @export
model_female_gdp <- function(data) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  if (!"gdp" %in% names(data)) stop("`data` must contain a `gdp` column.")
  if (!"female_leader" %in% names(data)) stop("`data` must contain a `female_leader` column.")

  clean <- data[!is.na(data$gdp) & !is.na(data$female_leader), ]

  stats::lm(log(gdp) ~ female_leader, data = clean)
}
