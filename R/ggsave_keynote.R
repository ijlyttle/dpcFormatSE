#' ggsave_black
#'
#' save ggplot using black-background theme
#'
#' @param file_name blah
#' @param plot blah
#'
#' @return NULL
#' 
#' @export
# 
ggsave_black <- function(file_name, plot){
  
  theme_keynote <- 
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "black", colour = "black", size = 0),
      plot.title = ggplot2::element_text(colour = "white"),
      legend.background = ggplot2::element_rect(fill = "black"),
      legend.text = ggplot2::element_text(colour = "white"),
      legend.title = ggplot2::element_text(colour = "white"),
      axis.text = ggplot2::element_text(colour = "white"),
      axis.title = ggplot2::element_text(colour = "white")
    )
  
  ggplot2::ggsave(file_name, plot = plot + theme_keynote)
  
}