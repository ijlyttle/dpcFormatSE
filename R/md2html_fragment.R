#' md2html_fragment
#' 
#' create an html fragment using markdown text
#' 
#' @param text_markdown
#' 
#' @return character, html fragment
#' 
#' @export
# 
md2html_fragment <- function(text_markdown){
  
  htmltools::HTML(
    markdown::markdownToHTML(text = text_markdown, fragment.only = TRUE)
  ) 
     
}