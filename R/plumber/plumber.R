###############################################################################
################################# Example API #################################
###############################################################################

# This provides a simple example of an API created with the plumber package

# Packages
library(tidyverse)

# Load existing model
simple_model <- readRDS("simple-model.rds")

# Create API endpoint

#* Simple model predicting mpg given hp and cyl
#* @param hp Horsepower
#* @param cyl Cylinder
#* @get /mpgpred
mpg_pred <- function(hp, cyl) {
  predict(simple_model,
          data.frame(
            hp = as.numeric(hp),
            cyl = as.numeric(cyl)
          ))
}

#* Return a plot of filtered data
#* @param cyl Cylinder value to filter mtcars to
#* @jpeg
#* @get /mpgplot
mpg_plot <- function(cyl) {
  plot_data <- mtcars
  if (!missing(cyl)) {
    cyl_filter <- as.numeric(cyl)
    plot_data <- mtcars %>% 
      filter(cyl == cyl_filter)
  }
  plot_data %>% 
    filter(cyl == cyl_filter) %>% 
    ggplot(aes(x = hp, y = mpg)) +
    geom_point() +
    theme_bw()
}
