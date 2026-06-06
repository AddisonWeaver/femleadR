dat <- load_unemployment_data()

test_that("summarize_unemployment returns a tibble with correct columns", {
  result <- summarize_unemployment(dat)
  expect_s3_class(result, "tbl_df")
  expect_true(all(c("regime_category", "number_of_countries", "avg_unemployment",
                    "above_10_percent", "percent_above_10") %in% names(result)))
})

test_that("summarize_unemployment works with custom year", {
  result <- summarize_unemployment(dat, year_filter = 2000)
  expect_s3_class(result, "tbl_df")
})

test_that("summarize_unemployment errors when data is not a data frame", {
  expect_error(summarize_unemployment("not a dataframe"), "`data` must be a data frame.")
})

test_that("summarize_unemployment errors when year_filter is not numeric", {
  expect_error(summarize_unemployment(dat, year_filter = "2019"), "`year_filter` must be a numeric year")
})

test_that("summarize_unemployment errors when year_filter is out of range", {
  expect_error(summarize_unemployment(dat, year_filter = 2021), "`year_filter` must be between 1950 and 2020.")
})
