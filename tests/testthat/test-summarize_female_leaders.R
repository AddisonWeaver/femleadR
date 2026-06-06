dat <- load_gdp_data()

test_that("summarize_female_leaders returns a tibble with correct columns", {
  result <- summarize_female_leaders(dat)
  expect_s3_class(result, "tbl_df")
  expect_true(all(c("country_name", "country_code", "years_with_female_leader", "avg_gdp") %in% names(result)))
})

test_that("summarize_female_leaders returns correct number of rows", {
  result <- summarize_female_leaders(dat, n = 5)
  expect_equal(nrow(result), 5)
})

test_that("summarize_female_leaders defaults to 10 rows", {
  result <- summarize_female_leaders(dat)
  expect_equal(nrow(result), 10)
})

test_that("summarize_female_leaders errors when data is not a data frame", {
  expect_error(summarize_female_leaders("not a dataframe"), "`data` must be a data frame.")
})

test_that("summarize_female_leaders errors when n is invalid", {
  expect_error(summarize_female_leaders(dat, n = -1), "`n` must be a positive integer.")
})
