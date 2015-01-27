#' well_html
#'
#' Creates a well panel with a centered title an html body
#'
#' @param title      character, title for panel
#' @param body_html  character, html for body
#'
#' @return html fragment describing a bootstrap well-panel 
#' 
#' @export
#' 
well_html <- function(title = "", body_html = ""){
  
  htmltools::tags$div(
    class = "well well-se_special",
    list(
      htmltools::tags$p(align = "center", title),
      body_html
    )
  )
  
}

#' well_markdown
#'
#' Creates a well panel with a centered title an html body,
#' generated using markdown
#'
#' @param title          character, title for panel
#' @param body_markdown  character, markdown for body
#'
#' @return html fragment describing a bootstrap well-panel
#' 
#' @export
#' 
well_markdown <- function(title = "", body_markdown = ""){
  
  body_html <- md2html_fragment(body_markdown)
  
  well_html(title, body_html)
}