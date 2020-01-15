# Source: @vintented via https://github.com/2DegreesInvesting/r2dii.analysis/
#   issues/6#issuecomment-561543097

library(readr)
library(here)

specs <- cols(
  Investor.Name = col_character(),
  Portfolio.Name = col_character(),
  Scenario = col_character(),
  ScenarioGeography = col_character(),
  Allocation = col_character(),
  Year = col_integer(),
  Sector = col_character(),
  Plan.Sec.EmissionsFactor = col_double(),
  Scen.Sec.EmissionsFactor = col_double()
)

portfolio_demo <- read_csv(here("data-raw", "portfolio.csv"), col_types = specs)
usethis::use_data(portfolio_demo, overwrite = TRUE)

market_demo <- read_csv(here("data-raw", "market.csv"), col_types = specs)
usethis::use_data(market_demo, overwrite = TRUE)
