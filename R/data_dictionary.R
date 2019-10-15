#' Data dictionary
#'
#' * `data_dictionary` is a dataset that defines the columns of other r2dii
#' datasets.
#' * `create_data_dictionary()` is a function that helps extend
#' `data_dictionary`. It is particularly useful when combined with
#' `datapasta::tibble_paste()`. See details.
#'
#' You may combine `create_data_dictionary()` with `datapasta::tribble_paste()`.
#' For example, this code:
#'
#' ```
#' library(r2dii.dataraw)
#' new_data <- tibble::tibble(x = 1, y = "a")
#'
#' datapasta::tribble_paste(
#'   create_data_dictionary(new_data)
#' )
#' ```
#'
#' outputs this text so you can conveniently fill the `definition` column:
#'
#' ```
#' tibble::tribble(
#'   ~dataset,   ~column, ~definition,
#'   "new_data",     "x",          NA,
#'   "new_data",     "y",          NA
#' )
#' ```
#'
#' @param dataset A dataframe.
#'
#' @family demo datasets
#'
#' @return A [tibble::tibble].
#'
#' @examples
#' data_dictionary
#'
#' new_dataset <- tibble::tibble(x = 1L, y = "a")
#' create_data_dictionary(new_dataset)
"data_dictionary"

#' @rdname data_dictionary
#' @export
create_data_dictionary <- function(data) {
  dataset <- rlang::quo_text(rlang::enquo(data))
  column <- names(data)

  tibble::tibble(
    definition = NA_character_,
    column = column,
    typeof = purrr::map_chr(data, ~typeof(.x)),
    dataset = dataset,
  )
}
