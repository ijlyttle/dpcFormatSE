library(htmltools)
library(markdown)

#' well_html
#'
#' Creates a well panel with a centered title an html body
#'
#' @param title      character, title for panel
#' @param body_html  character, html for body
#'
#' @return html fragment describing a bootstrap well-panel 
#' 
#' @import htmltools
#' @export
#' 
well_html <- function(title = "", body_html = ""){
  
  tags$div(
    class = "well well-se_special",
    list(
      tags$p(align = "center", title),
      body_html
    )
  )
  
}


#' well_markdown
#'
#' Creates a well panel with a centered title an html body,
#' generated using markdown
#'
#' @param title
#' @param body_markdown
#'
#' @return html fragment describing a bootstrap well-panel
#' 
#' @import markdown
#' @import htmltools
#' @export
#' 
well_markdown <- function(title = "", body_markdown = ""){
  
  body_html <- 
    text_markdown %>% 
    markdownToHTML(text = ., fragment.only = TRUE) %>% 
    HTML()
  
  well_html(title, body_html)
}