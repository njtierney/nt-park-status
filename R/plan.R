the_plan <-
  drake_plan(
    # I want to run these next two steps based on whether the latest day has
    # For example, on 2020-05-10, there should be a file called
    # "2020-05-10-nt-park-status.csv" in the data folder
    is_file_created = is_file_updated(),
    park_data = target(
      command = scrape_nt_park(),
      trigger = trigger(change = is_file_created)
    ),
    write_park_date = target(
      command = write_nt_park_data(park_data),
      trigger = trigger(change = is_file_created)
    ),
    # so the idea is that it will write data every day, and then produce
    # a report that tells me how open the parks are
    park_status = target(
      command = read_all_parks(),
      trigger = trigger(change = is_file_created)
    ),
    target_name = target(
      command = {
        rmarkdown::render(knitr_in("doc/park_status.Rmd"))
        file_out("doc/park_status.html")
      },
      trigger = trigger(change = is_file_created)
    )

)
