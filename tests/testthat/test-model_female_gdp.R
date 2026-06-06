dat <- load_gdp_data()

test_that("model_female_gdp returns a linear model", {
  result <- model_female_gdp(dat)
  expect_s3_class(result, "lm")
})

test_that("model_female_gdp model has correct terms", {
  result <- model_female_gdp(dat)
  expect_true("female_leaderTRUE" %in% names(coef(result)))
})

test_that("model_female_gdp errors when data is not a data frame", {
  expect_error(model_female_gdp("not a dataframe"), "`data` must be a data frame.")
})

test_that("model_female_gdp errors when gdp column is missing", {
  bad <- data.frame(female_leader = c(TRUE, FALSE))
  expect_error(model_female_gdp(bad), "`data` must contain a `gdp` column.")
})

test_that("model_female_gdp errors when female_leader column is missing", {
  bad <- data.frame(gdp = c(100, 200))
  expect_error(model_female_gdp(bad), "`data` must contain a `female_leader` column.")
})
