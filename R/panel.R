#' panel_html
#'
#' Creates a panel 
#'
#' @param title      character, title for panel
#' @param body_html  character, html for body
#' @param class      character, name of bootstrap panel class
#'
#' @return html fragment describing a bootstrap well-panel 
#' 
#' @export
#' 
panel_html <- function(title = "", body_html = "", class = "panel panel-default"){
  
  htmltools::tags$div(
    `class` = class,
    htmltools::tags$div(
      `class` = "panel-heading",
      htmltools::tags$h3(
        `class` = "panel-title",
        title
      ),
      htmltools::div(
        `class` = "panel-body",
        body_html
      )
    )
  )
  
}
        
#' panel_markdown
#'
#' Creates a well panel with a centered title an html body,
#' generated using markdown
#'
#' @param title          character, title for panel
#' @param body_markdown  character, markdown for body
#' @param class      character, name of bootstrap panel class
#'
#' @return html fragment describing a bootstrap well-panel
#' 
#' @export
#' 
panel_markdown <- function(title = "", body_markdown = "", class = "panel panel-default"){
  
  body_html <- md2html_fragment(body_markdown)
  
  panel_html(title, body_html, class)
}