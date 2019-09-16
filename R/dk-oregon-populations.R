# library(tidycensus)
# library(tidyverse)
# library(janitor)
#
# v17 <- load_variables(2017, "acs5", cache = TRUE)
#
# View(v17)
#
# census_vars <- load_variables(2010, "sf1", cache = TRUE)
#
# oregon_places <- get_decennial("place",
#                                year = 2010,
#                                state = "OR",
#                                variables = "H010001") %>%
#      clean_names() %>%
#      select(-c(geoid, variable)) %>%
#      mutate(name = str_remove(name, ", Oregon")) %>%
#      mutate(name = str_remove(name, "city")) %>%
#      mutate(name = str_remove(name, "CDP")) %>%
#      mutate(name = str_trim(name)) %>%
#      set_names(c("City", "Population"))
#
# write_csv(oregon_places, "oregon_places.csv")
#
