##' @title Scrape Northern Territory Parks Data
##'
##' @description To get a sense of how "open" the parks are, with the hopes of
##'   a July trip to Larapinta, this is my attempt at seeing which parks open,
##'   and how many open. Using data from \url{https://nt.gov.au/leisure/parks-reserves/plan-your-visit/check-park-open-alice-springs}
##'
##' @return data.frame of NT parks
##' @author Nicholas Tierney
##' @export
scrape_nt_park <- function(url) {

  nt_parks_url <- url

  nt_parks_data <- polite::bow(nt_parks_url) %>% polite::scrape()

  nt_park_names <- nt_parks_data %>%
    rvest::html_nodes(".card-header a") %>%
    rvest::html_text() %>%
    stringr::str_squish()

  nt_park_status <- nt_parks_data %>%
    rvest::html_nodes(".card .card-body table") %>%
    rvest::html_table() %>%
    purrr::set_names(nt_park_names) %>%
    dplyr::bind_rows(.id = "park_name") %>%
    tibble::as_tibble() %>%
    janitor::clean_names() %>%
    dplyr::mutate(date = lubridate::today(tzone = "Australia/Melbourne")) %>%
    dplyr::select(date, dplyr::everything())

  nt_park_status

}
