# Source: @jdhoffa
path <- here::here("data-raw/region_isos.rds")
region_isos <- readr::read_rds(path)

usethis::use_data(region_isos, overwrite = TRUE)
