library(tidyverse) > ggplot2::mpg
library(ggplot2)
library(dplyr)

cars <- ggplot2::mpg

ggplot(data = cars, aes(x = displ, y = cty, color = class, shape = class)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    x = "Engine Displacement (L)",
    y = "City Mileage (mpg)",
    title = "Association between Engine Displacement and City Mileage by Car Class"
  )