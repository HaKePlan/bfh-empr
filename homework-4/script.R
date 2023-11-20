library(readxl)
library(ggplot2)
library(forcats)
library(tidyverse)
library(patchwork)

setwd('./homework-4')
getwd()

dataImprot <- read_excel('./Data_HW4.xlsx')
data <- dataImprot

# questions:
# what is the most used transportaition?
viz_transport <- ggplot(data = data, aes(x = fct_infreq(transport), fill = transport)) +
  geom_bar() +
  coord_polar() +
  labs(title = 'Frequency of transportation used', y = '', x = '')

# now we can see, that the most come by train followed by bus and then car.
# so what are the distances here for the ones by car, bus or train?
viz_distance <- data |>
  aggregate(distance ~ transport, mean) |>
  ggplot(aes(x = reorder(transport, distance, decreasing = TRUE), y = distance, fill = transport)) +
    geom_bar(stat = "identity", color = "white", show.legend = FALSE) +
  labs(title = 'Mean distance by transportation', x = '')

# seems to make sence
viz_transport + viz_distance

