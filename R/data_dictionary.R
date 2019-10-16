#' Data dictionary
#'
#' * `data_dictionary()` is a dataset that defines the columns of other r2dii
#' datasets.
#'
#' @param data A dataframe.
#'
#' @family demo datasets
#'
#' @return A [tibble::tibble].
#'
#' @examples
#' data_dictionary()
data_dictionary <- function() {
  out <- dplyr::bind_rows(
    get_inst_extdata("data_dictionary.csv"),
    get_inst_extdata("loanbook.csv"),
    get_inst_extdata("nace_classification.csv"),
    get_inst_extdata("isic_classification.csv"),
  )

  dplyr::arrange(out, dataset, column)
}

path_inst_extdata <- function(regexp = NULL) {
  fs::dir_ls(system.file("extdata", package = "r2dii.dataraw"), regexp = regexp)
}

get_inst_extdata <- function(regexp = NULL) {
  suppressMessages(readr::read_csv(path_inst_extdata(regexp)))
}
