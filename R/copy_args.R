copy_args <- function(from, to) {

  assert_that(is.function(from),
              is.function(to))
  assert_that(!is.primitive(from),
              !is.primitive(to),
              msg = "Can't use primitive functions")

  int_f <- to
  formals(int_f) <- formals(from)
  return(int_f)
}

# is.args.same(iris, map_timed)
# source('R/tictocify.R')
# map_timed <- tictocify(map)
# is.args.same(map, map_timed)
#
# copy_args(map, compose)
