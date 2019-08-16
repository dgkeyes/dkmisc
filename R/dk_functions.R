#' @title Get TFFF basemaps
#'
#' @return
#' @export
#'
#' @examples
dk_get_tfff_basemap <- function() {

        tfff_basemap <- tigris::counties(cb = T, class="sf") %>%
                janitor::clean_names() %>%
                filter(statefp == "41" | statefp == "06") %>%
                filter(statefp == "41" | name == "Siskiyou")
}


#' Title DK Theme
#'
#' @return
#' @export
#'
#' @examples
dk_theme <- function() {

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

        options(tigris_class = "sf")

        or_communities <- tigris::places(state = "OR",
                                 cb = TRUE) %>%
                sf::st_centroid()

        ca_communities <- tigris::places(state = "CA",
                                 cb = TRUE) %>%
                sf::st_centroid()

        or_ca_communities <- rbind(or_communities,
                                   ca_communities) %>%
                janitor::clean_names() %>%
                dplyr::select(name)

}
