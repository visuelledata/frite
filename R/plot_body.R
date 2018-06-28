#' Plots the body of a non-primitive function
#'
#' Plots the body of a function so that you can easily see it while using other functions
#' in this package. It can be piped into and will return the function that you put into it.
#'
#' @param .f A function
#' @param nudge_y Moves the function body up or down, number
#' @param font_size Specifies text size, positive number
#' @param line_width Specifies how wide a line can be, positive number
#'
#' @section Warning:
#' Functions with large bodies will be difficult to plot correctly
#'
#' @return text in plot window, also returns function
#'
#' @seealso \code{\link{list_body}}
#'
#' @export
#'
#' @examples
#'
#' plot_body(lapply)
#' plot_body(strwrap, line_width = 90, font_size = .75, nudge_y = .12)
#'
plot_body <- function(.f, nudge_y = 0, font_size = .8, line_width = 110) {

  # Error checking
  assert_that(is.function(.f),
              is.number(nudge_y), is.number(font_size), is.number(line_width))
  assert_that(font_size > 0, line_width > 0)
  if (class(substitute(.f)) == "call") {
    stop("Functions can't be entered the following way: 'purrr::map'")
  }

  graphics::plot.new()

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
  graphics::text(-.15, 1.15,
                 labels = paste0(substitute(.f), "()", "'s ",
                                 "function body", " as a list"),
                 pos = 4, xpd = TRUE)

  graphics::text(x = -.15, y = .4 - nudge_y,
                 labels = list_f, cex = font_size,
                 pos = 4, xpd = TRUE)

  return(.f)
}
