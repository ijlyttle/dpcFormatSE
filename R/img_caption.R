#' img_caption
#'
#' creates an aligned table with an image and a caption
#'
#' @param src      string describing location of image
#' @param caption  string for caption
#' 
#' @return string html-code sepcifying table
#' 
#' @export
#' 
img_caption <- function(src, caption = ""){
    
  htmltools::tags$table(
    width = "40%", 
    align = "right",
    style = "margin-left: 40px; margin-top: 20px; margin-bottom: 20px;",
    htmltools::tags$tr(
      htmltools::tags$td(
        htmltools::tags$img(src = src, width = "100%")          
      )
    ),
    htmltools::tags$tr(
      htmltools::tags$td(
        align = "center",
        caption
      )
    )
  )
}