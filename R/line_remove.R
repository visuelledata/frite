#' Removes an expression from a function body
#'
#' This function will remove an expression from the function body. Use list_body() on any
#' function to see which lines are able to be removed.
#'
#' @param .f A non-primitive function
#' @param line An expression from the body of the function
#'
#' @return function
#'
#' @seealso \code{\link{list_body}}
#'
#' @examples
#'
#' line_remove(.f = map, line = 2)
#' line_remove(.f = map, line = 3)
#'
line_remove <- function(.f, line) {

  # Error checking
  assert_that(is.function(.f), is.number(line))
  assert_not_primitive(.f)
  assert_that(line %% 1 == 0, line >= 2,
              msg = "line must be a positive integer greater than 1")
  if (line > length(list_body(.f))) stop(paste("There is no 'line'", line))

  # Creates an identical function to .f, then removes a line from it
  int_f <- .f
  body(int_f) <- list_body(int_f)[-line] %>%
    as.call()

  return(int_f)
}
