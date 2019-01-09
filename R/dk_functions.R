#' @title Get TFFF basemaps
#'
#' @return
#' @export
#'
#' @examples
dk_get_tfff_basemap <- function() {

     library(tigris)
     library(tidyverse)
     library(janitor)

     tfff_basemap <- counties(cb = T, class="sf") %>%
          clean_names() %>%
          filter(statefp == "41" | statefp == "06") %>%
          filter(statefp == "41" | name == "Siskiyou")
}


