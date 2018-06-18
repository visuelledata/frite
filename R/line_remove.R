
line_remove <- function(.f, line) {

  assert_that(is.function(.f), is.number(line))
  assert_not_primitive(.f)

  int_f <- .f
  body(int_f) <- list_body(int_f)[-line]

  return(int_f)
}




