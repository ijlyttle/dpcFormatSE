#' bootstrap_se
#'
#' function to use to make a custom rendering of Rmd files
#'
#' @param ... args to pass through
#' 
#' @return character html fragment
#' 
#' @export
#'
bootstrap_se <- function(...) {
  
  css <- c(
      system.file(file.path("css", "bootstrap_se.css"), package = "dpcFormatSE"),
      system.file(file.path("css", "style_local.css"), package = "dpcFormatSE"),
      system.file(file.path("css", "style_local_web.css"), package = "dpcFormatSE")
  )
  
  # call the base html_document function, imposing our css
  rmarkdown::html_document(css = css, ...)
}