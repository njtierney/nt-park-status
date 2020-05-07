##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param park_data
##' @return
##' @author Nicholas Tierney
##' @export
nt_park_status <- function(park_data) {

  park_data %>%
    pull(access) %>%
    str_to_lower() %>%
    str_detect("open") %>%
    mean()

}
