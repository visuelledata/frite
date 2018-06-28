#' Converts the body of a function to a list
#'
#' This will help you see what code you're changing when using other functions in this
#' package.
#'
#' @param .f A non-primitive function
#'
#' @return A list
#'
#' @export
#'
#' @examples
#'
#' list_body(strwrap)
#'
list_body <- function(.f) {
  assert_that(is.function(.f))
  assert_not_primitive(.f)

  as.list(body(.f))
}
