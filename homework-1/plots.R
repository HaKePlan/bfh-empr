library(tidyverse) > ggplot2::mpg

cars <- ggplot2::mpg

# create a frequency table for drive and create a pie chart and bar chart for it
driveFreq <- table(cars$drv)

labels <- c("4 wheel drive", "front-wheel drive", "rear wheel drive")

pie(
  driveFreq,
  col = rainbow(24),
  radius = 0.9,
  labels = labels,
  main = "Frequency of drive modes"
)

barplot(driveFreq, names.arg = labels, main = "Frequency of drive modes")

# Histogram plot
hist(cars$hwy, xlab = "Highway miles per gallon", main = "The highway miles per gallon")

boxplot(cars$hwy, horizontal = TRUE, main = "The highway miles per gallon", xlab = "Higway miles per gallon")

plot(cars$displ, cars$hwy, ylab = "Highway miles per gallon", xlab = "Engine volume", main = "Association between highway miles and engine volume")

boxplot(cars$displ~cars$hwy)
