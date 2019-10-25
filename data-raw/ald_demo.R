path <- here::here("data-raw/ald_demo.csv")
ald_demo <- remove_rownames_column(readr::read_csv(path))

usethis::use_data(ald_demo, overwrite = TRUE)
