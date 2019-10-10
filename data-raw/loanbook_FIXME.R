path <- here::here("data-raw/loanbook.csv")

loanbook <- readr::read_csv(path)
# Remove column giving needless rownames
loanbook$X1 <- NULL
# Rewrite clean loanbook
readr::write_csv(loanbook, path)

# If using `utils::write.csv()`, then use `row.names = TRUE`.
# Or better use safer functions: `readr::write_csv()` or `vroom::vroom()`.
