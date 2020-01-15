library(dplyr)

test_that("market_demo hasn't changed", {
  expect_known_value(
    market_demo, "ref-market_demo",
    update = FALSE
  )
})
