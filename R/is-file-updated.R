#' is the parks file saved?
#'
#' @return logical
#' @export
is_file_updated <- function() {

  day_today <- lubridate::today(tzone = "Australia/Melbourne")

write_path <- glue::glue("data/{day_today}-nt-park-status.csv")

file.exists(write_path)

}

