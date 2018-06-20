#' Checks if two functions have identical arguments
#'
#' @param .f1 A function
#' @param .f2 A function
#'
#' @return logical - TRUE if arguments are identical
#'
is.args.same <- function(.f1, .f2) {
  # Error checking
  assert_that(is.function(.f1), is.function(.f2))

  identical(formals(.f1), formals(.f2))
}


#' Checks if arguments are primitive functions
#'
#' @details Wrapper for assertthat::assert_that()
#'
#' @param ... One or more functions
#'
#' @return logical - TRUE if all arguments are non-primitive functions
#'
assert_not_primitive <- function(...) {

  f_list <- list(...)

  # Checks if all optional arguments are functions
  map(f_list, f(Argument, assert_that(is.function(Argument))))

  # Checks optional arguments for primitive functions
  map_lgl(f_list,
          f(x, assert_that(!is.primitive(x),
                           msg = 'Primitive functions are invalid arguments'))
          ) %>%
    all()
}
