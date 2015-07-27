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


#' @export
div_se_logo_white <- function(){
  file_name <- system.file("img", "Logo_SE_White-Screen.png", package = "dpcFormatSE")
  str_image <- knitr::image_uri(file_name)
  
  htmltools::div(
    id = "se_logo_white",
    class = "pull-left",
    htmltools::img(
      height = "32",
      style = "padding-right: 32px;",
      src = str_image
    )
  )
}

#' @export
se_title <- function(title = ""){
  
  file_name <- system.file("img", "Logo_SE_White-Screen.png", package = "dpcFormatSE")
  str_image <- knitr::image_uri(file_name)
  
  list(
    htmltools::div(
      id = "se_logo_white",
      class = "pull-left",
      htmltools::img(
        height = "32",
        style = "padding-right: 32px;",
        src = str_image
      )
    ),
    htmltools::div(title, class = "pull-right", style = "padding-top: 7px;")    
  )

}
