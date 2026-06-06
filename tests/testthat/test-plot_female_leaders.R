dat <- load_gdp_data()

test_that("plot_female_leaders returns a ggplot", {
  expect_s3_class(plot_female_leaders(dat), "ggplot")
})

test_that("plot_female_leaders works with custom n", {
  expect_s3_class(plot_female_leaders(dat, n = 5), "ggplot")
})

test_that("plot_female_leaders errors when data is not a data frame", {
  expect_error(plot_female_leaders("not a dataframe"), "`data` must be a data frame.")
})

test_that("plot_female_leaders errors when n is invalid", {
  expect_error(plot_female_leaders(dat, n = -1), "`n` must be a positive integer.")
})
