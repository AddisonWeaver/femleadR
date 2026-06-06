#' Clean and Filter Democracy Data
#'
#' Filters the democracy dataset to only rows with a recorded female leader,
#' removing rows with missing values in key columns.
#'
#' @param data A data frame from \code{load_gdp_data()}.
#'
#' @return A tibble containing only rows where a female leader was recorded,
#'   with no missing values in country_name, year, or regime_category.
#' @importFrom dplyr filter
#' @export
clean_democracy <- function(data) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  if (!"female_leader" %in% names(data)) stop("`data` must contain a `female_leader` column.")

  data |>
    dplyr::filter(
      !is.na(country_name),
      !is.na(year),
      !is.na(regime_category),
      female_leader == TRUE
    )
}
