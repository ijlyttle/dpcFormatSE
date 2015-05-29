.se_palette <-
  c(
    sky_blue = "#42b4e6",
    honeysuckle_orange = "#e47f00",
    spruce_green = "#009530",
    fuschia_red = "#b10043",
    lady_fern_green = "#4fa600",
    sunflower_yellow = "#ffd100",
    seedling_green = "#87d300"
  )


#' se_palette
#' 
#' function to return colors of the Schneider Electric palette
#' 
#' @param name vector of colors to return (default NULL to return all)
#' 
#' @return character vector
#' 
#' @export
#' 
se_palette <- function(name = NULL){
  
  if( is.null(name) ){
    name = names(.se_palette)
  } 

  .se_palette[name]    
}

