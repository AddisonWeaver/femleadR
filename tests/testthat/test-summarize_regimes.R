dat <- load_data()

test_that("summarize_regimes returns a tibble with correct columns", {
  result <- summarize_regimes(dat)
  expect_s3_class(result, "tbl_df")
  expect_true(all(c("year", "regime_category", "count") %in% names(result)))
})

test_that("summarize_regimes works with min_year", {
  result <- summarize_regimes(dat, min_year = 2000)
  expect_true(min(result$year) >= 2000)
})

test_that("summarize_regimes works with max_year", {
  result <- summarize_regimes(dat, max_year = 2000)
  expect_true(max(result$year) <= 2000)
})

test_that("summarize_regimes works with both min_year and max_year", {
  result <- summarize_regimes(dat, min_year = 1990, max_year = 2000)
  expect_true(min(result$year) >= 1990)
  expect_true(max(result$year) <= 2000)
})

test_that("summarize_regimes errors when data is not a data frame", {
  expect_error(summarize_regimes("not a dataframe"), "`data` must be a data frame.")
})
