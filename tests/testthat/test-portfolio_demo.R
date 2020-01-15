library(dplyr)

test_that("portfolio_demo hasn't changed", {
  expect_known_value(
    portfolio_demo, "ref-portfolio_demo",
    update = FALSE
  )
})
