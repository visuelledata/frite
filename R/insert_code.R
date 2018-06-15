
insert_code <- function(.f, line, quoted_code) {

  assert_that(!is.primitive(.f), msg = "Can't use primitive functions")
  assert_that(is.function(.f),
              is.numeric(line),
              is.call(quoted_code))

  int_f <- .f
  body(int_f) <- list_body(int_f) %>%
    append(quoted_code, after = line) %>%
    as.call()

  return(int_f)
}



# insert_code(map, 2, quote(print('I love you')))
