

is.args.same <- function(.f1, .f2) {

  assert_that(is.function(.f1), is.function(.f2))

  identical(formals(.f1), formals(.f2))
}


assert_not_primitive <- function(...) {
  f_list <- list(...)
  map(f_list, function(x) assert_that(!is.primitive(x), msg = 'Primitive functions are invalid arguments'))
}


