#' Converts the body of a function to a list
#'
#' This allows for easy modification of functions and will help you see what code you are
#' changing when using other functions in this package.
#'
#' @param .f A non-primitive function
#'
#' @return A list
#'
#' @example
#'
#' list_body(accumulate)
#'
list_body <- function(.f) {
  assert_that(is.function(.f))
  assert_not_primitive(.f)

  as.list(body(.f))
}


