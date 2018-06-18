#Add documentation ='(

line_assign <- function(.f, line, assign_to){

  assert_not_primitive(.f)
  assert_that(is_scalar_character(assign_to), msg = 'assign_to is not a single string')
  if(line == 1) stop("'line = 1' is '{' and will produce an invalid function")
  if (line > length(list_body(.f))) stop(paste("There is no 'line'", line))

  changed_line <-
    list_body(.f)[line] %>%
    c(as.name('assign'), assign_to,  .) %>%
    as.call()


  line_insert(.f, line - 1, changed_line)

}


# timed_map <- map %>%
#   line_insert(1, quote(tic())) %>%
#   line_insert(15, quote(toc())) %>%
#   line_assign(4, 'a') %>%
#   line_insert(after_line = 9999, quote(return(a)))
#
# map_timed <- tictocify(map)
#
# is.output.same(map(1:1000000, sqrt), timed_map, map_timed)
