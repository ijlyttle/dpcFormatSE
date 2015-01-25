
bsModal <- function(id, title, trigger, ..., href) {
  
  mo <- htmltools::tags$div(
    class = "modal sbs-modal hide fade", 
    id = id,
    "data-trigger" = trigger,
    htmltools::tags$div(
      class = "modal-header",
      htmltools::tags$button(
        type = "button", 
        class = "close",
        "data-dismiss" = "modal", 
        htmltools::HTML("&times;")
      ),
      htmltools::tags$h3(title)),
      htmltools::tags$div(class = "modal-body"),
      htmltools::tags$div(
        class = "modal-footer",
        htmltools::tags$a(
          href = "#", 
          class = "btn", 
          "data-dismiss" = "modal", 
          "Close"
        )
      )
  )
  
  if(!missing(href)) {
    mo <- XML::addAttribs(mo, "data-remote" = href)
  } else {
    mo$children[[2]] <- 
      htmltools::tagAppendChildren(mo$children[[2]], list = list(...))
  }
  
  return(mo)
  
}
