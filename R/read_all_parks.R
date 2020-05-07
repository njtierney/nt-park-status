##' @title Read in all the parks data in data/
##' @return data.frame
##' @author Nicholas Tierney
##' @export
read_all_parks <- function() {

  fs::dir_map(here::here("data/"),
              fun = readr::read_csv) %>%
    dplyr::bind_rows()

}
