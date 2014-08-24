library(htmltools)

#' button_page_external
#'
#' generate html for a button to launch 
#' an external page in a new browser-tab
#'
#' @param url character, external link e.g. "https://ijlyttle.shinyapps.io/introduction"
#' @param label character, html for the button
#'
#' @return html fragment describing a div with a centered button
#' 
#' @import htmltools
#' @export
#' 
#'
button_page_external <- function(url, label = "") {
  
  tags$div(
    align = "center",
    tags$a(
      class = "btn",
      href = url,
      target = "_blank",
      label
    )
  )  
  
}


#' button_modal
#'
#' @param id
#' @param idModal
#' @param class
#' @param icon
#' @param label
#' 
#' @return character html fragment
#' 
#' @import htmltools
#' @export
#'
button_modal <- function(id, idModal, class = "btn", icon = NULL, label = ""){
  
  tags$div(
    align = "cneter",
    tags$button(
      id = id,
      `data=toggle` = "modal",
      `data-target` = paste0("#", idModal),
      class = class,
      list(icon, label)
    )
  )
}