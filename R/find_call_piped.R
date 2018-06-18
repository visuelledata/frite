#' Finds the call that generated the value that was passed through a pipe.
#'
#' This is a function that receives a value through a pipe, then traces it through the stack to
#' find the original pipe call and extract it. The use case for this is when you want to write a
#' function that receives code rather than a value, you can put it as the first line of code in
#' your function. However, this defeats the purpose of the pipe and can cause confusion for
#' someone looking at your code.
#'
#' @param .piped A value passed through a pipe.
#'
#' @return call
#'
#' @example
#' sum(1:3) %>%
#'   identity() %>%
#'   is.na() %>%
#'   find_call_piped()
#'

find_call_piped <- function(.piped) {

  # A function that wraps the parent.frame() tail() and head_while()
  pipe_env <- purrr::compose(parent.frame,
                             purrr::partial(tail, n = 3),
                             purrr::head_while)

  # Returns the last environment in which 'chain_parts' exists
  env <- pipe_env(1:sys.nframe(),
                  f(.n, !('chain_parts' %in% ls(envir=parent.frame(.n)))))

  # Returns the code at the top of the pipe chain, if no pipes then returns .piped code
  if (exists('chain_parts', env)) {
    warning("You have undone the evaluation of the pipe")
    return(env$chain_parts$lhs)
  } else {
    return(do.call("substitute", list(substitute(.piped), parent.frame())))
  }
}
