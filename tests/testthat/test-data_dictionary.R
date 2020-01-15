library(dplyr)

test_that("data_dictionary defines the expected objects", {
  datasets <- data_dictionary() %>%
    dplyr::pull(dataset) %>%
    unique()

  expected_datasets <- c(
    "data_dictionary",
    "ald",
    "loanbook",
    "market",
    "portfolio",
    "nace_classification",
    "isic_classification"
  )

  expect_equal(sort(datasets), sort(expected_datasets))
})

test_that("data_dictionary hasn't changed", {
  expect_known_value(
    data_dictionary(), "ref-data_dictionary",
    update = FALSE
  )
})

test_that("data_dictionary has the expected names", {
  expect_named(
    data_dictionary(),
    c("dataset", "column", "typeof", "definition")
  )
})

test_that("data_dictionary defines all its names", {
  dd_definitions <- data_dictionary() %>%
    dplyr::filter(.data$dataset == "data_dictionary")

  expect_equal(nrow(dd_definitions), 4L)

  dd_columns <- sort(dd_definitions$column)
  expect_equal(dd_columns, sort(names(data_dictionary())))
})

test_that("data_dictionary has 9 rows where dataset is 'market'", {
  data_dictionary() %>%
    filter(dataset == "market") %>%
    nrow() %>%
    expect_equal(9L)
})

test_that("data_dictionary for market has same columns as in market_demo", {
  actual <- data_dictionary() %>%
    filter(dataset == "market") %>%
    pull(column) %>%
    sort()

  expected <- sort(names(market_demo))
  expect_equal(actual, expected)
})

test_that("data_dictionary has 9 rows where dataset is 'portfolio'", {
  data_dictionary() %>%
    filter(dataset == "portfolio") %>%
    nrow() %>%
    expect_equal(9L)
})

test_that("data_dictionary for portfolio has same columns as in portfolio_demo", {
  actual <- data_dictionary() %>%
    filter(dataset == "portfolio") %>%
    pull(column) %>%
    sort()

  expected <- sort(names(portfolio_demo))
  expect_equal(actual, expected)
})
