# Source withr::with_options
with_options <- function (new, code) {
  old <- set_options(new_options = new)
  on.exit(set_options(old))
  force(code)
}

# Source withr::with_options
set_options <- function (new_options) {
  do.call(options, as.list(new_options))
}

#' Ready csv fieles in a way that is compatible with legacy code
#'
#' TODO? See https://github.com/2DegreesInvesting/Reference/issues/36
#' @noRd
read_csv_ <- function(x, ...) {
  check_path(x)

  out <- utils::read.csv(x, strip.white = TRUE, stringsAsFactors = FALSE, ...)
  as_tibble(out)
}

check_path <- function(path) {
  if (!fs::file_exists(path)) {
    abort(glue(
      "Can't find {ui_path(path)}.
      There is no such file or directory."
    ))
  }

  invisible(path)
}

read_datastore <- function(path) {
  read_csv_(DATA.STORE.PATH(path))
}

