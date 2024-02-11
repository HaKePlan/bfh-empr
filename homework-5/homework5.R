library(tidyverse)
library(babynames)
library(readxl)
library(dplyr)
library(stringr)

##############################################
# Task 1

boy_names <- filter(babynames, sex == "M")$name
girl_names <- filter(babynames, sex == "F")$name

mean_boy_names <- mean(str_length(boy_names))
mean_girl_names <- mean(str_length(girl_names))

##############################################
# Task 2

data_task2 <- read_excel('./homework-5/MedicalTest-2.xlsx')

# id = first three characters
# group = character 4 til 8
# sex = character 9
# dose = last three characters

data_task2_wider <- data_task2 |>
  separate(col = proben, into = c('id', 'group', 'sex', 'dose'), sep = c(3, 8, 9, 12))

##############################################
# Task 3

data_task3 <- read_excel('./homework-5/Rezepte-2.xlsx')

data_task3_longer <- data_task3 |> separate_rows(zutaten, sep = ',')

##############################################
# Task 4

data_task4 <- read_excel('./homework-5/Colours-2.xlsx')

data_task4_longer <- data_task4 |> separate_longer_position(farben, 3)

##############################################
# Task 5

data_task5 <- read_excel('./homework-5/Objects-2.xlsx')

data_task5_wider <- data_task5 |> separate_wider_delim(objekte, delim = ':', names = c('code', 'year', 'version'))

##############################################
# Task 5

girl_names <- babynames %>%
  filter(sex == "F")

# Extract the last letter from each girl's name
girl_last_letters <- girl_names %>%
  mutate(last_letter = substr(name, nchar(name), nchar(name)))

# Create a table of frequencies
frequency_table <- girl_last_letters %>%
  count(last_letter, sort = TRUE)

##############################################
# Task 6

line1 <- "The table was a large one, but the three were all crowded together at one corner of it:"
line2 <- '"No room! No room!" they cried out when they saw Alice coming.'
line3 <- "\"There's plenty of room!\" said Alice indignantly, and she sat down in a large arm-chair at one end of the table."

lines <- c(line1, line2, line3)
print(lines)

str_view(lines)
writeLines(lines)


##############################################
# Task 13

food <- "apple"
price <- 1.99

# Original str_c() expression
original_str <- str_c("The price of ", food, " is ", price)
cat("Original: ", original_str, "\n")

# Conversion to str_glue()
converted_str <- str_glue("The price of {food} is {price}")
cat("Converted: ", converted_str, "\n")

##############################################
# Task 14

names_14 <- babynames |>
  filter(sex == "F") |>
  mutate(first_letter = str_sub(name, 1, 1),
         last_letter = str_sub(name, -1))

# Count frequencies
first_letter_freq <- names_14 |>
  count(first_letter, sort = TRUE)

last_letter_freq <- names_14 |>
  count(last_letter, sort = TRUE)

# Extract most frequent first and last letters
most_frequent_first <- first_letter_freq$first_letter[1]
most_frequent_last <- last_letter_freq$last_letter[1]

# Print the result
result <- tolower(paste(most_frequent_first, most_frequent_last, sep = ","))
cat("Most frequent first and last letters:", result, "\n")
