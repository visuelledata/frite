#' Wraps a line of code within a function in assign()
#'
#' This function is used to assign expressions within a function to a value of your choice.
#' It can be used with line_insert() to modify what a function returns, add additional
#' conditional statements, and add more to already existing functions.
#'
#' @inheritParams line_remove
#' @param assign_to The name of the variable to assign to, as a string
#'
#' @return function
#'
#' @seealso \code{\link{line_remove}} \code{\link{line_insert}}
#'
#' @export
#'
#' @examples
#'
#' new_map <- line_assign(strwidth, line = 3, assign_to = 'abc')
#' line_insert(new_map, after_line = 4, quote(return(abc)))
#'
#'
line_assign <- function(.f, line, assign_to){

  # Error Checking
  assert_not_primitive(.f)
  assert_that(is_scalar_character(assign_to),
              msg = "assign_to is not a single string")
  assert_that(line >= 2, line %% 1 == 0,
              msg = "line must be a positive integer greater than 1")
  if (line > length(list_body(.f))) stop(paste("There is no 'line'", line))

  # Extracts an expression from function body and wraps it in assign
  changed_line <-
    list_body(.f)[line] %>%
    c(as.name("assign"), assign_to,  .) %>%
    as.call()

  # Removes the extracted expression and inserts modified expression
  line_remove(.f, line) %>%
    line_insert(line - 1, changed_line)
}
