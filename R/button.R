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
#' @export
#' 
button_page_external <- function(url, label = "") {
  
  htmltools::tags$div(
    align = "center",
    htmltools::tags$a(
      role = "button",
      class = "btn btn-primary",
      href = url,
      target = "_blank",
      label
    )
  )  
  
}


