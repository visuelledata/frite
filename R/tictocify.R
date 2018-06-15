#' Creates a function that functions identically to the original, but gives execution time
#'
#' Takes any function and returns a nearly identical function that will behave in the same
#' manner, but will return the time it takes to execute the function.
#'
#' @param ..f Any function that isn't primitive (sum, list, etc...)
#' @param tic_args A list of arguments to be passed into tic()
#' @param toc_args A list of arguments to be passed into toc()
#'
#' @details Creates a wrapper function around a function call, preceded by tic() and
#'  toc(). The wrapper will be given the same arguments as the original function and
#'  work identically to the original function.
#'
#' @return function
#'
#' @seealso [is.output.same()]
#'
#' @examples
#'
#' set.seed(1)
#' stuff <- rnorm(n = 100000)
#'
#' map_lgl_new <- tictocify(map_lgl)
#'
#' map_lgl_new(.f = function(x) x > 0, .x = stuff)
#' map_lgl_new(stuff, function(x) x > 0) %>% sum() %>% as.character()
#'
#' is.output.same(map_lgl_new(stuff, function(x) x > 0), map_lgl)
#'

tictocify <- function(..f, tic_args = NULL, toc_args = NULL) {

  # Error checking
  assertthat::assert_that(is.function(..f))
  assertthat::assert_that(!is.primitive(..f), msg = "..f can't be a primitive function.")
  if (!is.null(tic_args)) assertthat::assert_that(is.list(tic_args))
  if(!is.null(toc_args)) assertthat::assert_that(is.list(toc_args))

  # Creates a wrapper function for ..f which will call ..f and give its execution time
  int_f <- function() {
    ifelse(is.null(tic_args),
           tictoc::tic(),
           do.call(tictoc::tic, tic_args))

    x <- do.call(..f, map(names(formals(..f)), as.name))

    ifelse(is.null(toc_args),
           tictoc::toc(),
           do.call(tictoc::toc, toc_args))
    return(x)
  }

  # Makes the arguments of the returned function identical to the original
  formals(int_f) <- formals(..f)
  return(int_f)
}
