context("find_call_piped")

test_that("find_call_piped return has type 'language'", {
  expect_type(find_call_piped(sum(1:3)), "language")
  expect_type(find_call_piped(sum(1:3)), "language")
})

test_that("find_call_piped gives warning when piped", {
  expect_warning(sum(1:3) %>% find_call_piped())
})
