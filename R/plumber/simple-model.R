###############################################################################
################################# Simple Model ################################
###############################################################################

# Create a simple model from the mtcars data
simple_model <- lm(mpg ~ hp + cyl, data = mtcars)

# Save model
saveRDS(simple_model,
        "R/plumber/simple-model.rds")
