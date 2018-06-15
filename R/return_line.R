return_line <- function(.f, line){

  if(line == 1) stop("'line = 1' is '{' and will produce an invalid function")
  if (line > length(list_body(.f))) stop(paste("There is no 'line'", line))

  changed_line <-
    list_body(.f)[line] %>%
    c(as.name('assign'), 'return_val',  .) %>%
    as.call()


  int_f <- insert_code(.f, line - 1, changed_line)

  insert_code(int_f, line = length(list_body(int_f)), quote(return(return_val)))
}


# timed_map <- insert_code(map, 1, quote(tic())) %>%
#   insert_code(9999999, quote(toc())) %>%
#   return_line(4)
#
# map_timed <- tictocify(map)
#
# set.seed(1)
# is.output.same(map(1:3, sqrt), map_timed, timed_map)

