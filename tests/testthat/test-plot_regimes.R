dat <- load_data()

test_that("plot_regimes returns a ggplot", {
  expect_s3_class(plot_regimes(dat), "ggplot")
})

test_that("plot_regimes works with min_year", {
  expect_s3_class(plot_regimes(dat, min_year = 2000), "ggplot")
})

test_that("plot_regimes works with max_year", {
  expect_s3_class(plot_regimes(dat, max_year = 2000), "ggplot")
})

test_that("plot_regimes works with both min_year and max_year", {
  expect_s3_class(plot_regimes(dat, min_year = 1990, max_year = 2000), "ggplot")
})

test_that("plot_regimes errors when data is not a data frame", {
  expect_error(plot_regimes("not a dataframe"), "`data` must be a data frame.")
})
