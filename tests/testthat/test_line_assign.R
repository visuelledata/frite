context("line_assign")

test_that("line_assign returns obect of type closure", {
  expect_type(line_assign(strwidth, 2, "a"), "closure")
})

test_that("line_assign gives error for primitive functions", {
  expect_error(line_assign(sum, 2, "a"))
})

test_that("line_assign throws error for arg line = 1", {
  expect_error(line_assign(strwrap, 1, "a"))
})
