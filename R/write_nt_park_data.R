##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param park_data
##' @return
##' @author Nicholas Tierney
##' @export
write_nt_park_data <- function(park_data) {

  day_today <- lubridate::today(tzone = "Australia/Melbourne")

  write_path <- glue::glue("data/{day_today}-nt-park-status.csv")

  if (file.exists(write_path)) {
    usethis::ui_done("File {basename(write_path)} already exists")
  }

  if (!file.exists(write_path)) {
    readr::write_csv(x = park_data, path = here::here(write_path))
    usethis::ui_done("File {basename(write_path)} saved")
  }

}
