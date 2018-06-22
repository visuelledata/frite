context("line_insert")

test_that("line_insert returns a closure", {
  expect_type(line_insert(strwrap, 1, quote(print(""))), "closure")
})

test_that("line_insert throws an error non-integer is given", {
  expect_error(line_insert(strwrap, 1.5, quote(print(""))))
})
