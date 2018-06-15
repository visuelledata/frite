list_body <- function(.f) {
  assert_that(is.function(.f))

  as.list(body(.f))
}


