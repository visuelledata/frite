context("tictocify")

test_that("tictocify returns a closure", {
  expect_type(tictocify(strwidth), "closure")
})

test_that("tictocify functions give errors when arg names are duplicated", {
  reduce_timed <- tictocify(reduce)
  expect_error(reduce_timed(1:3, sum))
})


test_that("tictocify functions work when duped args are given", {
  reduce_timed <- tictocify(reduce)
  expect_output(reduce_timed(1:3, sum, .init = 0))
})

test_that("tictocify produce equal output to original", {
  reduce_timed <- tictocify(reduce)
  expect_equal(reduce_timed(1:3, sum, .init = 0), reduce(1:3, sum))
})
