#' IS a park open?
#'
#' @param x column to detect open
#'
#' @return
#' @export
#'
#' @examples
detect_open <- function(x){
  str_to_lower(x) %>% str_detect("open")
}
