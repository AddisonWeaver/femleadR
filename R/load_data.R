#' Load the female leadership dataset
#'
#' Loads the raw dataset directly from the TidyTuesday GitHub repository.
#'
#' @return A tibble containing the female leadership data.
#' @importFrom readr read_csv
#' @export
#'
#' @examples
#' dat <- load_data()

load_data <- function(){
  readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2024/2024-11-05/democracy_data.csv')
}
