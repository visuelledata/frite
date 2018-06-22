#' Plots the body of a non-primitive function
#'
#' Plots the body of a function so that you can easily see it while using other functions
#' in this package. It is pipeable and will return the function that you put into it.
#'
#' @param .f A function
#' @param nudge_y Moves the function body up or down, number
#' @param font_size Specifies text size, positive number
#' @param line_width Specifies the line width, positive number
#'
#' @section Warning:
#' Functions with large bodies will be difficult to plot correctly
#'
#' @return text in plot window, also returns function
#'
#' @seealso \code{\link{list_body}}
#'
#' @examples
#'
#' plot_body(map)
#' plot_body(cross)
#'
plot_body <- function(.f, nudge_y = 0, font_size = .8, line_width = 110) {

  # Error checking
  assert_that(is.function(.f),
              is.number(nudge_y), is.number(font_size), is.number(line_width))
  assert_that(font_size > 0, line_width > 0)

  plot.new()

  # Formats the function body to be plottable
  list_f <- .f %>%
    list_body() %>%
    as.character()
  list_f <- list_f %>%
    paste0("Line ", 1:length(list_f), ":    ", .) %>%
    stringr::str_wrap(width = line_width, exdent = 16) %>%
    stringr::str_c(collapse = "\n")

  if (stringr::str_length(list_f) > 2600)
    warning("All lines may not be plotted, adjust args")

  # Plots the title, then body
  text(-.15, 1.15 - nudge_y,
       labels = paste0(substitute(.f), "()", "'s ",
                       "function body"," as a list"),
       pos = 4, xpd = TRUE)

  text(x = -.15, y = .4 - nudge_y,
       labels = list_f, cex = font_size,
       pos = 4, xpd = TRUE)

  return(.f)
}
