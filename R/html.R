library(htmltools)
library(markdown)

#' md2html_fragment
#' 
#' @param text_markdown
#' 
#' @return character, html fragment
#' 
#' @import htmltools
#' @import markdown
#' @export
#' 
md2html_fragment <- function(text_markdown){
  
  text_markdown %>% 
    markdownToHTML(text = ., fragment.only = TRUE) %>% 
    HTML()  
}