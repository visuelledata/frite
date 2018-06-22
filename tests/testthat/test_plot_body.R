context("plot_body")

test_that("plot_body returns a function", {
  expect_is(plot_body(map), "function")
})

test_that("plot_body gives errors for primitive functions", {
  expect_error(plot_body(sum)),
  expect_error(plot_body(round))
})

test_that("plot_body gives warnings for long functions", {
  expect_warning(plot_body(data.frame))
})
