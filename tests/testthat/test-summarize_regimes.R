test_that("summarize_regimes returns correct structure", {
  dat <- load_data()

  result <- summarize_regimes(dat)

  expect_s3_class(result, "tbl_df")
  expect_true(all(c("year", "regime_category", "count") %in% names(result)))
})

test_that("summarize_regimes year filter works", {
  dat <- load_data()

  result <- summarize_regimes(dat, min_year = 2000, max_year = 2010)

  expect_true(min(result$year) >= 2000)
  expect_true(max(result$year) <= 2010)
})

test_that("summarize_regimes validates input", {
  expect_error(summarize_regimes("not a dataframe"), "`data` must be a data frame.")
})
