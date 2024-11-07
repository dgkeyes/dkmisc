#' Save ggplot using pixels for dimensions
#'
#' @param plot Name of plot to save
#' @param width Width in pixels
#' @param height Height in pixels
#' @param text_factor
#' @param filename Filename to save to
#'
#' @return
#' @export
#'
#' @examples
ggsave_pixels <- function(plot,
                          width = 640,
                          height = 1280,
                          text_factor = 1,
                          filename) {

        # Source: https://stackoverflow.com/questions/26551359/r-ggsave-save-thumbnail-size-200-x-200-scaled-image/46296679

        dpi <- text_factor * 100
        width_calc <- width / dpi
        height_calc <- height / dpi

        ggplot2::ggsave(filename = filename,
                        dpi = dpi,
                        width = width_calc,
                        height = height_calc,
                        units = 'in',
                        plot = plot)
}


# Create pts function. See https://gist.github.com/andrewheiss/93f3da5d6daa8c10c37cc97d8c8d83ab

#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
pts <- function(x) {
        as.numeric(grid::convertUnit(grid::unit(x, "pt"), "mm"))
}



#' Use ragg as default device in RMarkdown
#'
#' @return
#' @export
#'
#' @examples https://www.jumpingrivers.com/blog/r-knitr-markdown-png-pdf-graphics/
use_ragg <- function() {
        ragg_png = function(..., res = 192) {
                ragg::agg_png(..., res = res, units = "px")
        }

        knitr::opts_chunk$set(dev = "ragg_png", fig.ext = "png")
}


ragg_save <- function(...) {
        ragg::ang_png(...)
        ggplot2::last_plot()
        dev.off()
}

