#' Title
#'
#' @param .data
#' @param group_by_var
#' @param mean_var
#'
#' @return
#' @export
#'
#' @examples
dk_means_by_groups_and_total <- function(.data, group_by_var, mean_var){

     groups_summary <- .data %>%
          dplyr::group_by({{ group_by_var }}) %>%
          dplyr::summarize(mean = mean({{ mean_var }})) %>%
          dplyr::rename("group" = {{ group_by_var }} ) %>%
          dplyr::mutate(group = as.character(group))

     overall_summary <-.data %>%
          dplyr::summarize(mean = mean({{ mean_var }})) %>%
          dplyr::mutate(group = "Total")

     dplyr::bind_rows(groups_summary,
                      overall_summary)

}


