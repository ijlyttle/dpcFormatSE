#' button_external
#'
#' generate html for a button to launch 
#' an external page in a new browser-tab
#'
#' @param url    character, external link e.g. "https://ijlyttle.shinyapps.io/introduction"
#' @param label  character, html for the button
#' @param class  character, describes the class of the button ("btn btn-primary")
#'
#' @return html fragment describing a div with a centered button
#' 
#' @export
# 
button_external <- function(url, label = "", class = "btn btn-primary") {
  
  htmltools::tags$div(
    align = "center",
    htmltools::tags$a(
      role = "button",
      class = class,
      href = url,
      target = "_blank",
      label
    )
  )  
  
}

#' @rdname button_external
#' @export
button_external_page <- function(url, label = ""){
  button_external(url, label, class = "btn btn-primary")
}

#' @rdname button_external
#' @export
button_external_app <- function(url, label = ""){
  button_external(url, label, class = "btn btn-info")
}


