
line_insert <- function(.f, after_line, quoted_code) {

  assert_not_primitive(.f)
  assert_that(is.function(.f),
              is.numeric(after_line),
              is.call(quoted_code))

  int_f <- .f
  body(int_f) <- list_body(int_f) %>%
    append(quoted_code, after = after_line) %>%
    as.call()

  return(int_f)
}



# line_insert(map, 2, quote(print('I love you')))
