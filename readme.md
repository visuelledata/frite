frite
-----

[![Travis-CI Build
Status](https://travis-ci.org/visuelledata/frite.svg?branch=master)](https://travis-ci.org/visuelledata/frite)
[![](https://cranlogs.r-pkg.org/badges/frite)](https://cran.r-project.org/package=frite)
[![CRAN Status
Badge](http://www.r-pkg.org/badges/version/frite)](https://cran.r-project.org/package=frite)

`frite` is a package that provides tools to modify and write functions.
It can also aid in code generation or metaprogramming. Or you can just
use the diagnostic functions for code refactoring.

-   Diagnostic <br>
    -   `tictocify` *returns a nearly identical timed version of its
        input* <br>
    -   `is.output.same` *performs call on multiple functions and sees
        if they match*
-   Modification <br>
    -   `line_assign` *inserts `assign()` into a function* <br>
    -   `line_insert` *inserts code into a function* <br>
    -   `line_remove` *removes code from a function* <br>
    -   `copy_args` *copies the arguments of one function to another*
-   Helping <br>
    -   `list_body` *converts function body to a list* <br>
    -   `plot_body` *plots `list_body()` so you can inspect the body*

Installation
------------

You can install `frite` from cran:

`install.packages("frite")`

Or you can install the development version from github:

`install.packages("devtools")`

`devtools::install_github("visuelledata/frite")`

<br> See the getting started vignette for more!
