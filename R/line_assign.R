#Remove the last return line and make a insert_return function
#Add an argument to allow naming 'return_val'
#Edit commented code on bottom
#Add documentation ='(
#Make a line_wrap function
#Rename all functions to line_....

line_assign <- function(.f, line, assign_to){

  assert_not_primitive(.f)
  assert_that(is_scalar_character(assign_to), msg = 'assign_to is not a single string')
  if(line == 1) stop("'line = 1' is '{' and will produce an invalid function")
  if (line > length(list_body(.f))) stop(paste("There is no 'line'", line))

  changed_line <-
    list_body(.f)[line] %>%
    c(as.name('assign'), assign_to,  .) %>%
    as.call()


  int_f <- line_insert(.f, line - 1, changed_line)
  return(int_f)
}


# timed_map <- line_insert(map, 1, quote(tic())) %>%
#   line_insert(15, quote(toc())) %>%
#   line_assign(4, c('a','b')) %>%
#   line_insert(line = 9999, quote(return(a)))
#
# map_timed <- tictocify(map)
#
# set.seed(1)
# is.output.same(map(1:100000, sqrt), map_timed, timed_map)
