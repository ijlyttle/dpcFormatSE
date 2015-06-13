#' panel_html
#'
#' Creates a panel 
#'
#' @param body_html  character, html for body
#' @param title      character, title for panel
#' @param class      character, name of bootstrap panel class
#'
#' @return html fragment describing a bootstrap panel 
#' 
#' @export
#' 
panel_html <- function(body_html = "", title = "", class = "panel panel-default"){
  
  htmltools::tags$div(
    `class` = class,
    htmltools::tags$div(
      `class` = "panel-heading",
      htmltools::tags$h3(
        `class` = "panel-title",
        title
      )
    ),
    htmltools::div(
      `class` = "panel-body",
      body_html
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
#' @return html fragment describing a bootstrap panel
#' 
#' @export
#' 
panel_markdown <- function(title = "", body_markdown = "", class = "panel panel-default"){
  
  body_html <- dpcFormatSE::md2html_fragment(body_markdown)
  
  dpcFormatSE::panel_html(body_html, title, class)
}

#' panel_markdown_section
#'
#' Wraps panel_markdown, setting the class of the panel
#'
#' @param title          character, title for panel
#' @param body_markdown  character, markdown for body
#'
#' @return html fragment describing a bootstrap panel
#' 
#' @export
#' 
panel_markdown_section <- function(title = "", body_markdown = ""){
  
  body_html <- md2html_fragment(body_markdown)
  
  dpcFormatSE::panel_html(body_html, title,  class = "panel panel-primary")
}

#' panel_html_exercise
#'
#' Wraps panel_html, setting the class of the panel
#'
#' @param title          character, title for panel
#' @param body_html      character, html for body
#'
#' @return html fragment describing a bootstrap panel
#' 
#' @export
#' 
panel_html_exercise <- function(title = "", body_html = "", class = "panel panel-info"){
  
  dpcFormatSE::panel_html(body_html, title, class)

}


#' panel_exercise
#' 
#' builds an html panel, with a possibility for modal/modal botton at bottom 
#' 
#' At the bottom of the panel, there will be a button to activate a modal.
#' 
#' @param content_panel   character, markdown or html to use as content for panel ("")
#' @param title_panel     character, title to display for panel ("Exercise")
#' @param id_modal        character, unique within page, to identify the modal panel 
#' @param content_modal   character, markdown or html to use as content for modal ("")
#' @param title_modal     character, title to display for modal ("Answer")
#' 
#' @return html for panel and modal
#' @export
#' 
panel_exercise <- 
  function(content_panel = "", title_panel = "Exercise",
           id_modal, content_modal = "", title_modal = "Answer"){
    
    # assemble some html, using whiskers {{}} for placeholders
    html_raw <- 
      tags$html(
        markdown::markdownToHTML(text = content_modal, fragment.only = TRUE),
        tags$div(
          align = "center",
          actionButton("{{id}}_btn", label = title_modal, class = "btn btn-info") 
        ),
        bsModal(
          id = "{{id}}_modal", 
          title = title_modal,
          trigger = "{{id}}_btn",
          size = "medium",
          markdown::markdownToHTML(text = content_modal, fragment.only = TRUE)
        ),
        # some javascript to tell the panel to reload when it is hidden
        # the effect of this is to stop videos from playing when the 
        # modal window is closed.
        #
        # http://stackoverflow.com/questions/13799377/twitter-bootstrap-modal-stop-youtube-video
        #
        tags$script(
          "$('#{{id}}_modal').on('hidden.bs.modal', function (e) {
             $('#{{id}}_modal iframe').attr('src', $('#{{id}}_modal iframe').attr('src'));
           });"
        )
      )
  
    # use whisker to interpolate {{id}}
    html_interp <- whisker::whisker.render(html_raw, data = list(id = id_modal)) 
    
    # build the panel
    dpcFormatSE::panel_html(html_div_proc, title = title_panel, class = "panel panel-info")
  }

