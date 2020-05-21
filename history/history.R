library(tidyverse)
library(drake)

history <- drake_history(analyze = TRUE)


history_park_data <- history %>%
  filter(target == "park_data")

hash <- history_park_data %>%
  pull(hash)

builds <- history_park_data %>%
  pull(built)

cache <- drake_cache()

nt_history_parks <-
map_dfr(hash,
        cache$get_value,
        .id = "build") %>%
  arrange(desc(build))

nt_history_parks %>%
  mutate(open = detect_open(comments)) %>%
  group_by(date) %>%
  summarise(n_open = sum(open))
