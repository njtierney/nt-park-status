the_plan <- drake_plan(
      park_data = target(
        command = scrape_nt_park("https://nt.gov.au/leisure/parks-reserves/plan-your-visit/check-park-open-alice-springs"),
        trigger = trigger(change = file_timestamp())
      ),
      report = target(
        command = {
          rmarkdown::render(knitr_in("docs/park_status.Rmd"))
          file_out("docs/park_status.html")
          }
        )
      )
