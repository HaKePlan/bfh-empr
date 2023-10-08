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

barplot(driveFreq, names.arg = labels, main = "Frequency of drive modes", ylab = 'Number of cars', col = rainbow(3))

# Histogram plot
hist(cars$hwy, xlab = "Highway miles per gallon", main = "The highway miles per gallon")

hist(cars$hwy, xlab = "Highway miles per gallon", main = "The highway miles per gallon", breaks = 20)

boxplot(cars$hwy, horizontal = TRUE, main = "The highway miles per gallon", xlab = "Higway miles per gallon")

plot(cars$displ, cars$hwy, ylab = "Highway miles per gallon", xlab = "Engine volume", main = "Association between highway miles and engine volume")

boxplot(cars$hwy~cars$drv, horizontal = TRUE, xlab = "Highway =  miles per gallon", ylab = "drive modes",
        col = rainbow(3), main = "Association between mpg and drive modes") # TODO: beautify (main)

# frequenci table of drive modes with class association
catDrvFreq <- table(cars$class, cars$drv)

# stacked bar chart
barplot(catDrvFreq, col = rainbow(nrow(catDrvFreq)), legend.text = rownames(catDrvFreq), names.arg = labels, ylab = 'Number of cars', main = "Association between drive mode and car class")

# clustered bar chart
barplot(catDrvFreq, col = rainbow(nrow(catDrvFreq)), legend.text = rownames(catDrvFreq), names.arg = labels, ylab = 'Number of cars', main = "Association between drive mode and car class", beside = TRUE)

# conditional distribution bar chart (stacket)
catDrvFreq2 <- table(cars$drv, cars$class)

conditional_distribution <- catDrvFreq2 / rowSums(catDrvFreq2)

barplot(t(conditional_distribution),
        main = "Conditional Distribution of Car Class by Drive Mode",
        xlab = "Drive Mode",
        ylab = "Percentage",
        col = rainbow(nrow(catDrvFreq)), legend.text = rownames(catDrvFreq))

mosaicplot(catDrvFreq2, main = "Joint Distribution of Drive Mode and Car Class",
           xlab = "Drive Mode",
           ylab = "Car Class",
           color = rainbow(length(catDrvFreq2)))


