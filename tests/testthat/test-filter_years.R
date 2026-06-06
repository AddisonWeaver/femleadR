dat <- load_data()

test_that("filter_years filters by min_year correctly", {
  result <- femleadR:::filter_years(dat, min_year = 2000)
  expect_true(min(result$year) >= 2000)
})

test_that("filter_years filters by max_year correctly", {
  result <- femleadR:::filter_years(dat, max_year = 2001)
  expect_true(max(result$year) <= 2001)
})

test_that("filter_years filters by both min and max year correctly", {
  result <- femleadR:::filter_years(dat, min_year = 2000, max_year = 2001)
  expect_true(min(result$year) >= 2000)
  expect_true(max(result$year) <= 2001)
})

test_that("filter_years errors when data is not a data frame", {
  expect_error(femleadR:::filter_years("not a df"), "`data` must be a data frame.")
})

test_that("filter_years errors when data has no year column", {
  bad <- data.frame(x = 1:3)
  expect_error(femleadR:::filter_years(bad), "`data` must contain a `year` column.")
})

test_that("filter_years errors on non-numeric min_year", {
  expect_error(femleadR:::filter_years(dat, min_year = "2000"), "`min_year` must be a numeric year")
})

test_that("filter_years errors on non-numeric max_year", {
  expect_error(femleadR:::filter_years(dat, max_year = "2000"), "`max_year` must be a numeric year")
})

test_that("filter_years errors when min_year is out of range", {
  expect_error(femleadR:::filter_years(dat, min_year = 1800), "`min_year` must be between 1950 and 2020.")
})

test_that("filter_years errors when max_year is out of range", {
  expect_error(femleadR:::filter_years(dat, max_year = 2021), "`max_year` must be between 1950 and 2020.")
})

test_that("filter_years errors when min_year > max_year", {
  expect_error(femleadR:::filter_years(dat, min_year = 2001, max_year = 2000), "`min_year` must be less than or equal to `max_year`.")
})
