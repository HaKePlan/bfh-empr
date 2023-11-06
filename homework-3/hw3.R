library(nycflights13) # and look at flights data set
library(ggplot2)
library(ggridges)

?flights

?weather

glimpse(flights)


flights |>
  merge(weather, by = intersect(names(flights), names(weather))) |>
  filter(origin=="JFK") |>
  filter(temp >= 86.00) |>
  distinct(year, month, day) |>
  group_by(month) |> count(month)

flights |>
  filter((month == 12) & (is.na(arr_time))) |>
  summarize(across(everything(), ~ sum(is.na(.))))

names(weather)

adj_weather <- weather
adj_weather$month_name <- month.name[adj_weather$month]

ggplot(adj_weather, aes(x = temp)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  facet_wrap(~ month_name, ncol = 3) +
  labs(title = "Temperature Distribution by Month", x = "Temperature (°C)", y = "Frequency")

ggplot(adj_weather, aes(x = temp, y = month_name)) +
  geom_density_ridges(fill = "blue", color = "black") +
  labs(title = "Temperature Distribution by Month", x = "Temperature (°C)", y = "Month") +
  scale_y_discrete(labels = month.name) +
  theme_ridges() +
  theme(legend.position = "none")

aggregated_weather <- adj_weather |>
  group_by(month) |>
  filter(!is.na(temp)) |>
  summarize(
    mean_temp = mean(temp),
    std_dev = sd(temp),
    n = n()
  ) |>
  mutate(
    upper_limit = mean_temp + 2 * (std_dev / sqrt(n)),
    lower_limit = mean_temp - 2 * (std_dev / sqrt(n))
  )

ggplot(aggregated_weather, aes(x = month, y = mean_temp)) +
  geom_line() +
  geom_ribbon(aes(ymin = lower_limit, ymax = upper_limit), fill = "blue", alpha = 0.3) +
  labs(title = "Monthly Average Temperature with 95% Confidence Intervals",
       x = "Month",
       y = "Average Temperature (°C)")