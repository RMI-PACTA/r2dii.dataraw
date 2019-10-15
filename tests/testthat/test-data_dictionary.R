library(tibble)

test_that("data_dictionary hasn't changed", {
  expect_known_value(
    data_dictionary, "ref-data_dictionary",
    update = FALSE
  )
})

test_that("create_data_dictionary outupts the expected tibble", {
  new_data <- tibble::tibble(x = 1L, y = "a")
  out <- create_data_dictionary(new_data)

  reference <- tibble::tribble(
    ~definition,   ~column,~typeof,     ~dataset,
    NA_character_, "x",    "integer",   "new_data",
    NA_character_, "y",    "character", "new_data",
  )
  expect_equal(out, reference)
})
