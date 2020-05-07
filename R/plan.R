the_plan <-
  drake_plan(

    # I want to run these next two steps based on whether the latest day has
    # passed
    park_data = scrape_nt_park(),
    write_park_date = write_nt_park_data(park_data),
    # so the idea is that it will write data every day, and then produce
    # a report that tells me how open the parks are
    # park_status = nt_park_status(park_data),
    target_name = target(
      command = {
        rmarkdown::render(knitr_in("doc/park_status.Rmd"))
        file_out("doc/park_status.html")
      }
    )

)
