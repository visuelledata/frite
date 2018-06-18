list_body <- function(.f) {
  assert_that(is.function(.f))
  assert_not_primitive(.f)

  as.list(body(.f))
}


