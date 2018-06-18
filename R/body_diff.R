body_diff <- function(.f1, .f2) {

  assert_that(is.function(.f1), is.function(.f2))
  assert_not_primitive(.f1, .f2)

  setdiff1 <- setdiff(list_body(.f1), list_body(.f2))

  if (identical(setdiff1, list())) setdiff(list_body(.f2), list_body(.f1))
  else setdiff1
}

# temp <- remove_code(tictocify, 2)
# body_diff(temp, tictocify)
# body_diff(tictocify, temp)
