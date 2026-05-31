test_that("plot_regimes returns a ggplot", {
  dat <- load_data()

  plot_simple <- plot_regimes(dat)
  plot_filtered <- plot_regimes(dat, min_year = 2000)

  expect_s3_class(plot_simple, "ggplot")
  expect_s3_class(plot_filtered, "ggplot")
})

test_that("plot_regimes validates input", {
  expect_error(plot_regimes("not a dataframe"), "`data` must be a data frame.")
})
