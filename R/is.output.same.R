#' Checks if the arguments in .call will produce identical output in other functions
#'
#' The use for this is to evaluate your code, while you're cleaning your functions. You
#' can have a function call as the first argument and the name of the cleaned function
#' as the second argument, then it will evaluate the functions with identical arguments
#' and see if the output is identical.
#'
#' @param .call Function call, such as '.call = my_function(x = 1:3)
#' @param ...   One or more function names
#' @param quiet Optional warning suppression
#'
#' @details Use only in pipe chains with a length of one, or it will evaluate up to the
#'  top of the chain. Also it's not recommended to use pipes with this function, as it
#'  undoes what the pipe is intended to do. If you don't pipe in .call, then the function
#'  operates off the fact that calls given inside of function calls function are promises,
#'  allowing the code to be wrapped in substitute() within the function.
#'
#' @return logical - TRUE if outputs are identical
#'
#' @seealso [find_call_piped()]
#'
#' @examples
#'
#' library(dplyr)
#' is.output.same(map(1:3, cumsum), lapply) # TRUE
#' is.output.same(cumsum(1:3), cumprod)     # FALSE
#' is.output.same(sum(1:3), prod)           # FALSE for outputs of different class
#' subset(iris, Sepal.Width < 5) %>%        # Pipeable
#'   is.output.same(filter)
#' mean(1:3) %>%                            # FALSE
#'   is.output.same(median)
#'

is.output.same <- function(.call, ..., quiet = FALSE) {

  # Optional warning
  if (quiet == TRUE) suppressWarnings(.call <- find_call_piped(.call))
    else .call <- find_call_piped(.call)

  # Error checking
  .call_value <- eval(.call)
  if (!all(map_lgl(list(...), is.function))) stop("... should be functions")
  if (missing(...)) stop("Need at least 1 optional argument.")

  # Makes list of function names
  f_names <- eval(substitute(alist(...)))

  # Creates function calls, evaluates them against .call, checks output
  map2(rep(list(.call), length(f_names)),
       f_names,
       function(.x, .y, i) {
         .x[[1]] <- .y
         return(.x)
        }) %>%
    map(eval) %>%
    map_lgl(identical, x = .call_value) %>%
    all()
}
