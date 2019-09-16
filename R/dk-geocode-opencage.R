#' Title
#'
#' @param location
#' @param country
#'
#' @return
#' @export
#'
#' @examples
dk_geocode_opencage <- function(location, country = "US") {

     opencage::opencage_forward(placename = location,
                      countrycode = country)$results %>%
          dplyr::select(geometry.lng, geometry.lat, confidence) %>%
          dplyr::top_n(1) %>%
          dplyr::slice(1) %>%
          dplyr::select(-confidence) %>%
          dplyr::set_names(c("longitude", "latitude"))

}


