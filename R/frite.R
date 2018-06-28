#' frite: A package for function modification and writing.
#'
#' This package contains functions that modify functions, helper functions for the
#' modifying functions, and diagnostic functions.
#'
#' @section Modifying functions:
#' \code{\link{line_assign}}
#'
#' \code{\link{line_insert}}
#'
#' \code{\link{line_remove}}
#'
#' \code{\link{copy_args}}
#'
#'
#' @section Helper functions:
#' \code{\link{plot_body}}
#'
#' \code{\link{list_body}}
#'
#' @section Diagnostic functions:
#' \code{\link{tictocify}}
#'
#' \code{\link{is.output.same}}
#'
#' @importFrom assertthat assert_that
#' @importFrom assertthat is.number
#' @importFrom magrittr %>%
#' @importFrom purrr is_scalar_character
#' @importFrom purrr map
#' @importFrom purrr map_lgl
#' @importFrom purrr map2
#' @importFrom tictoc tic
#' @importFrom tictoc toc
#'
#' @docType package
#' @name frite
NULL

# Supresses note of R CMD check regarding "."
if (getRversion() >= "2.15.1")  utils::globalVariables(c("."))
