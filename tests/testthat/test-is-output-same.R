context("is.output.same")

test_that("is.output.same returns logical", {
  expect_type(is.output.same(sum(1:3), prod), 'logical')
})

test_that("is.output.same returns false for outputs of different class", {
  expect_false(is.output.same(sum(1:3), prod))
})

test_that("is.output.same throws warning when piped", {
  expect_warning(sum(1:3) %>% is.output.same(prod))
})
