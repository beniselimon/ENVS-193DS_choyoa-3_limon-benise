library(ggplot2)
library(tibble)

polar_art <- function(seed, n, palette) {
  
  # set the state of the random number generator
  set.seed(seed)
  
  # data frame containing random values for 
  # aesthetics we might want to use in the art
  dat <- tibble(
    x0 = runif(n),
    y0 = runif(n),
    x1 = x0 + runif(n, min = -1, max = 1),
    y1 = y0 + runif(n, min = -1, max = 1),
    shade = runif(n), 
    size = runif(n)
  )
  
  # plot segments in various colours, using 
  # polar coordinates and a gradient palette
  dat |> 
    ggplot(aes(
      x = x0,
      y = y0,
      xend = x1,
      yend = y1,
      colour = shade,
      size = size
    )) +
    geom_segment(show.legend = FALSE) +
    coord_polar() +
    scale_y_continuous(expand = c(0, 0)) +
    scale_x_continuous(expand = c(0, 0)) + 
    scale_colour_gradientn(colours = palette) + 
    scale_size(range = c(0, 6)) + 
    theme_void()
}

polar_art(
  seed = 4, 
  n = 100, 
  palette = c("indianred1", "lightgoldenrod1", "mediumpurple1")
)

