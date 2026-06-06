dat <- load_gdp_data()

test_that("clean_democracy returns a tibble", {
  result <- clean_democracy(dat)
  expect_s3_class(result, "tbl_df")
})

test_that("clean_democracy only returns rows with female leaders", {
  result <- clean_democracy(dat)
  expect_true(all(result$female_leader == TRUE))
})

test_that("clean_democracy removes rows with missing country_name", {
  result <- clean_democracy(dat)
  expect_true(all(!is.na(result$country_name)))
})

test_that("clean_democracy removes rows with missing year", {
  result <- clean_democracy(dat)
  expect_true(all(!is.na(result$year)))
})

test_that("clean_democracy removes rows with missing regime_category", {
  result <- clean_democracy(dat)
  expect_true(all(!is.na(result$regime_category)))
})

test_that("clean_democracy errors when data is not a data frame", {
  expect_error(clean_democracy("not a dataframe"), "`data` must be a data frame.")
})

test_that("clean_democracy errors when female_leader column is missing", {
  bad <- data.frame(country_name = "A", year = 2000, regime_category = "Democracy")
  expect_error(clean_democracy(bad), "`data` must contain a `female_leader` column.")
})
