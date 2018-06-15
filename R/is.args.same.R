is.args.same <- function(.f1, .f2) {

  assert_that(is.function(.f1), is.function(.f2))

  identical(formals(.f1), formals(.f2))
}
