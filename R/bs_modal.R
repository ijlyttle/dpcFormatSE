#' button_modal
#'
#' @param id blah
#' @param idModal blah
#' @param class blah
#' @param icon blah
#' @param label blah
#' 
#' @return character html fragment
#' 
#' @export
#
button_modal <- function(id, idModal, icon = NULL, label = ""){
  
  htmltools::tags$div(
    align = "center",
    htmltools::tags$button(
      `type` = "button",
      `class` = "btn btn-info",
      `data-toggle` = "modal",
      `data-target` = paste0("#", idModal),
      list(icon, label)
    )
  )
}

#' bs_modal
#' 
#' create html for bootstrap modal - based on ebailey78/shinyBS bsModal
#' 
#' @param id blah
#' @param title blah
#' @param trigger blah
#' @param ...
#' 
#' @return character, html fragment
#' 
#' @export
# 
bs_modal <- function(id, title, trigger, ...) {
    
  # ref: http://getbootstrap.com/javascript/#modals
  mo <-
    htmltools::tags$div(
      `class` = "modal fade",
      `id` = id,
      `tabindex` = "-1",
      `role` = "dialog",
      `aria-labelledby` = "myModalLabel",
      `aria-hidden` = "true",
      htmltools::tags$div(
        `class` = "modal-dialog",
        htmltools::tags$div(
          `class` = "modal-content",
          htmltools::tags$div(
            `class` = "modal-header",
            htmltools::tags$button(
              `type` = "button",
              `class` = "close",
              `data-dismiss` = "modal",
              `aria-label` = "Close",
              htmltools::tags$span(
                `aria-hidden` = "true",
                htmltools::HTML("&times;")
              )
            ),
            htmltools::tags$h4(
              `class` = "modal-title",
              `id` = "myModalLabel",
              title
            )
          ),
          htmltools::tags$div(
            `class` = "modal-body",
            list(...)
          ),
          htmltools::tags$div(
            `class` = "modal-footer",
            htmltools::tags$button(
              `type` = "button",
              `class` = "btn btn-primary",
              `data-dismiss` = "modal",
              "Close"
            )
          )
        )
      )
    )

  
  return(mo)
  
}
