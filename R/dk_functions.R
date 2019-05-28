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


#' Title
#'
#' @return
#' @export
#'
#' @examples
dk_theme <- function() {
     library(ggplot2)

     theme_minimal() +
          theme(axis.title = element_blank(),
                legend.position = "none",
                text = element_text(family = "Karla",
                                    face = "bold"))
}


#' Title
#'
#' @return
#' @export
#'
#' @examples
dk_get_or_ca_places <- function() {
        library(tigris)
        library(tidyverse)
        library(sf)
        library(janitor)

        options(tigris_class = "sf")

        or_communities <- places(state = "OR",
                                 cb = TRUE) %>%
                st_centroid()

        ca_communities <- places(state = "CA",
                                 cb = TRUE) %>%
                st_centroid()

        or_ca_communities <- rbind(or_communities,
                                   ca_communities) %>%
                clean_names() %>%
                select(name)

}
