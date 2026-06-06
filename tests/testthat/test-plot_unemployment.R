dat <- load_unemployment_data()

test_that("plot_unemployment returns a ggplot", {
  expect_s3_class(plot_unemployment(dat), "ggplot")
})

test_that("plot_unemployment works with custom year", {
  expect_s3_class(plot_unemployment(dat, year_filter = 2000), "ggplot")
})

test_that("plot_unemployment errors when data is not a data frame", {
  expect_error(plot_unemployment("not a dataframe"), "`data` must be a data frame.")
})

test_that("plot_unemployment errors when year_filter is not numeric", {
  expect_error(plot_unemployment(dat, year_filter = "2019"), "`year_filter` must be a numeric year")
})

test_that("plot_unemployment errors when year_filter is out of range", {
  expect_error(plot_unemployment(dat, year_filter = 2021), "`year_filter` must be between 1950 and 2020.")
})
