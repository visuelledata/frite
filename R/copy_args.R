#' Copies the arguments of one function to another
#'
#' You can use this when you want to create a function very similar to the original and
#' retroactively define the arguments.
#'
#' @param from A function with the arguments to copy
#' @param to A function to receive new arguments
#'
#' @return function
#'
#' @seealso See \code{\link{tictocify}} function body for a use case.
#'
#' @export
#'


copy_args <- function(from, to) {

  # Error checking
  assert_that(is.function(from), is.function(to))
  assert_not_primitive(from, to)

  int_f <- to
  formals(int_f) <- formals(from)

  return(int_f)
}
