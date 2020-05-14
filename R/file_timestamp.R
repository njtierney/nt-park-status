##' @title Return the timestamp for today

##' @return
##' @author Nicholas Tierney
##' @export
file_timestamp <- function() {

  lubridate::now(tzone = "Australia/Melbourne")

}
