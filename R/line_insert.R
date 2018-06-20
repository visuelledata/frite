#' Inserts code into function
#'
#' Inserts code wrapped in the quote function into a function after the specified line.
#'
#' @param .f Any non-primitive function
#' @param after_line An integer that specifies where to insert quoted_code
#' @param quoted_code An expression wrapped in quote()
#'
#' @return function
#'
#' @seealso [list_body()] [line_insert()] [line_remove()]
#'
#' @example
#'
#' map_hello <- line_insert(map, 1, quote(print('Hello!')))
#'
line_insert <- function(.f, after_line, quoted_code) {

  # Error checking
  assert_not_primitive(.f)
  assert_that(is.function(.f),
              is.numeric(after_line),
              is.call(quoted_code))
  if(after_line <= 0) stop("'after_line' must be a positive integer")

  # Appends the body list with quoted_code, converts it to a call, assigns it as body
  int_f <- .f
  body(int_f) <- list_body(int_f) %>%
    append(quoted_code, after = after_line) %>%
    as.call()

  return(int_f)
}



