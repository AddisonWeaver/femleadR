test_that("filter_years filters correctly", {
  dat <- load_data()

  result_min <- filter_years(dat, min_year = 2000)
  result_max <- filter_years(dat, max_year = 1990)
  result_both <- filter_years(dat, min_year = 1980, max_year = 2000)

  expect_true(min(result_min$year) >= 2000)
  expect_true(max(result_max$year) <= 1990)
  expect_true(min(result_both$year) >= 1980)
  expect_true(max(result_both$year) <= 2000)
})

test_that("filter_years validates input types", {
  dat <- load_data()
  expect_error(filter_years(dat, min_year = "2000"), "`min_year` must be numeric.")
  expect_error(filter_years(dat, max_year = "2000"), "`max_year` must be numeric.")
})
