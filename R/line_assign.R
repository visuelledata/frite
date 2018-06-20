#' Wraps a line of code within a function in assign()
#'
#' This function is used to assign expressions within a function to a value of your choice.
#' It can be used with line_insert() to modify what a function returns, add additional
#' conditional statements, and add more to already existing functions.
#'
#' @param .f A non-primitive function
#' @param line The expression number of the function to assign
#' @param assign_to The name of the variable to assign to, as a string
#'
#' @return function
#'
#' @seealso [line_remove()] [line_insert()]
#'
#' @example
#'
#' map %>%
#'   line_assign(line = 2, assign_to = 'abc') %>%
#'   line_insert(after_line = 3, quote(return(abc)))
#'
#'
line_assign <- function(.f, line, assign_to){

  # Error Checking
  assert_not_primitive(.f)
  assert_that(is_scalar_character(assign_to), msg = 'assign_to is not a single string')
  if(line <= 1) stop("'line' must be a positive integer greater than 1")
  if (line > length(list_body(.f))) stop(paste("There is no 'line'", line))

  # Extracts an expression from function body and wraps it in assign
  changed_line <-
    list_body(.f)[line] %>%
    c(as.name('assign'), assign_to,  .) %>%
    as.call()

  # Removes the extracted expression and inserts modified expression
  line_remove(.f, line) %>%
    line_insert(line - 1, changed_line)

}


