###############################################################################
################################# Example API #################################
###############################################################################

# This provides a simple example of an API created with the plumber package

# Load existing model
# simple_model <- readRDS("simple-model.rds")

# Create API endpoint

#* Simple model predicting mpg given hp and cyl
#* @param hp Horsepower
#* @param cyl Cylinder
#* @get /mpgpred
mpg_pred <- function(hp, cyl) {
  simple_model <- lm(mpg ~ hp + cyl, data = mtcars)
  
  predict(simple_model,
          data.frame(
            hp = as.numeric(hp),
            cyl = as.numeric(cyl)
          ))
}
