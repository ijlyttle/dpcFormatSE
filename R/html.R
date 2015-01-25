library(htmltools)
library(markdown)

#' md2html_fragment
#' 
#' @param text_markdown
#' 
#' @return character, html fragment
#' 
#' @export
#' 
md2html_fragment <- function(text_markdown){
  
  htmltools::HTML(
    markdown::markdownToHTML(text_markdown, fragment.only = TRUE)
  ) 
     
}