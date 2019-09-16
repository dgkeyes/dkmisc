#' Title
#'
#' @return
#' @export
#'
#' @examples
dk_view_acs_vars <- function() {
     tidycensus::load_variables(2017, "acs5", cache = TRUE) %>%
          DT::datatable()
}

