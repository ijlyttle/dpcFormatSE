#' panel_html
#'
#' Creates a panel 
#'
#' @param div_content  div, html for body
#' @param title        character, title for panel
#' @param class        character, name of bootstrap panel class
#'
#' @return html fragment describing a bootstrap panel 
#' 
#' @export
#' 
panel_html <- function(div_content, title = "", class = "panel panel-default"){
  
  htmltools::tags$div(
    `class` = class,
    htmltools::tags$div(
      `class` = "panel-heading",
      htmltools::tags$h3(
        `class` = "panel-title",
        title
      )
    ),
    htmltools::tags$div(
      `class` = "panel-body",
      div_content
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

js_reload_modal <- function(id){
  # some javascript to tell the panel to reload when it is hidden
  # the effect of this is to stop videos from playing when the 
  # modal window is closed.
  #
  # http://stackoverflow.com/questions/13799377/twitter-bootstrap-modal-stop-youtube-video
  #
  script_template <-
    "$('#{{id}}_modal').on('hidden.bs.modal', function (e) {
      $('#{{id}}_modal iframe').attr('src', $('#{{id}}_modal iframe').attr('src'));
    });"   
  
  script_interp <- 
    htmltools::HTML(whisker::whisker.render(script_template, list(id = id)))
 
  script_interp 
}


#' div_modal
#' 
#' creates a button and modal window
#'  
#' @param id        character, unique within page, to identify the modal panel 
#' @param div_content   character, markdown or html to use as content for modal ("")
#' @param title     character, title to display for modal ("")
#' 
#' @return html div
#' @export
#' 
div_modal <- function(id, div_content = "", title = "", size = "medium"){

  id_btn <- whisker::whisker.render("{{id}}_btn", list(id = id))
  id_modal <- whisker::whisker.render("{{id}}_modal", list(id = id))
  
  # script to stop video when modal closed
  script_modal <- js_reload_modal(id)
  
    htmltools::tags$div(
      align = "center",
      shiny::actionButton(id_btn, label = title, class = "btn btn-primary"),
      shinyBS::bsModal(
        id = id_modal, 
        title = title,
        trigger = id_btn,
        size = size,
        div_content,
        htmltools::tags$script(script_modal)
      )      
    )
}

html_fragment <- function(x){
  
  # if this is not a shiny tag, convert to html & wrap in div
  if (!identical(class(x), "shiny.tag")){
    x <- tags$div(md2html_fragment(x))
  }
  
  x 
}

#' panel_section
#' 
#' builds an html panel, with a possibility for modal/modal botton at bottom 
#' 
#' At the bottom of the panel, there will be a button to activate a modal.
#' 
#' @param div_content   character, markdown or html to use as content for panel ("")
#' @param title         character, title to display for panel ("")
#' 
#' @return html for panel 
#' @export
#' 
panel_section <- 
  function(div_content = "", title = ""){

  # build the panel
  dpcFormatSE::panel_html(div_content, title = title, class = "panel panel-primary")  
        
}

#' panel_exercise
#' 
#' builds an html panel, with a possibility for modal/modal botton at bottom 
#' 
#' At the bottom of the panel, there will be a button to activate a modal.
#' 
#' @param div_content_panel   character, markdown or html to use as content for panel ("")
#' @param title_panel     character, title to display for panel ("Exercise")
#' @param id_modal        character, unique within page, to identify the modal panel 
#' @param div_content_modal   character, markdown or html to use as content for modal ("")
#' @param title_modal     character, title to display for modal ("Answer")
#' 
#' @return html for panel and modal
#' @export
#' 
panel_exercise <- 
  function(div_content_panel = "", title_panel = "Exercise",
           id_modal, div_content_modal = "", title_modal = "Answer"){

    div_content <- 
      htmltools::tags$div(
        div_content_panel,
        div_modal(id= id_modal, div_content = div_content_modal, title = title_modal)
      )  

    # build the panel
    panel_html(div_content, title = title_panel, class = "panel panel-info")
    
  }

