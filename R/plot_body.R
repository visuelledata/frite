#' Plots the body of a non-primitive function
#'
#' Plots the body of a function so that you can easily see it while using other functions
#' in this package. It is pipeable and will return the function that you put into it.
#'
#' @param .f A function
#' @param spacing Specifies space between lines, positive number
#' @param font_size Specifies text size, positive number
#' @param line_width Specifies the line width, positive number
#'
#' @return text in plot window and function
#'
#' @seealso [list_body()]
#'
#' @examples
#'
#' plot_body(map)
#' plot_body(cross, spacing = .0872, font_size = .54, line_width = 100)
#'
plot_body <- function(.f, spacing = .15, font_size = .8, line_width = 80) {

  # Error checking
  assert_that(is.function(.f),
              is.number(spacing), is.number(font_size), is.number(line_width))
  map_lgl(.x = list(spacing, font_size, line_width),
          function(x) assert_that(.x > 0, msg = "Negative numbers are invalid"))

  plot.new()

  # Formats the function body to be plottable
  list_f <- .f %>%
    list_body() %>%
    as.character()
  list_f <- list_f %>%
    paste0("Line ", 1:length(list_f), ":    ", .) %>%
    stringr::str_wrap(width = line_width, exdent = 16)

  # Plots the title
  text(-.05, 1.02, labels = paste0(substitute(.f), "()", "'s ", "function body",
                                   " as a list"), pos = 4)

  # Plots the text
  map2(seq(.96, 0, by = -spacing)[1:length(list_f)], list_f,
       f(x, y, text(-.05, x, y, pos = 4, cex = font_size)))

  return(.f)
}
