# Source: https://github.com/2DegreesInvesting/r2dii.dataraw/pull/4

path <- here::here("data-raw/loanbook.csv")
loanbook_demo <- readr::read_csv(path)

usethis::use_data(loanbook_demo, overwrite = TRUE)
