library(htmltools)

#' button_page_external
#'
#' generate html for a button to launch 
#' an external page in a new browser-tab
#'
#' @param url character, external link e.g. "https://ijlyttle.shinyapps.io/introduction"
#' @param label character, html for the button
#'
#' @return html fragment describing the button and the action
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