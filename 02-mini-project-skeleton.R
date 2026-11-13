library(tidyverse)

# Load the data ----

tt <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/"
tb <- read_csv(paste0(tt, "2025/2025-11-11/who_tb_data.csv"))

# Inspect the data ----

# Look at column types and values
glimpse(tb)

# Explore the data in the Data Explorer (like a spreadsheet)
View(tb)

# Note the column names, they are case sensitive!!! 
names(tb)


# Filter the data ----

# You can choose one country and see how one column has evolved over time
tb |>
  filter(country == "Brazil") |>
  select(country, year, c_newinc_100k, ...)


# Or you can benchmarking current rates for a selection of countries
tb |>
  filter(year == 2023 & country %in% c("Brazil", "Peru", "Colombia", "Costa Rica")) %>%
  select(country, ...)


# Make a plot with your filtered data ----

# Example, one rate over time

# c_cdr = Case detection rate (all forms) [also known as TB treatment coverage], percent
# e_mort_num = Estimated number of deaths from TB (all forms)

tb_tidy <- tb |>
  filter(country %in% c("Brazil", "Peru", "Colombia", "Costa Rica")) %>%
  select(country, year, e_mort_num) 

# How can we make this more interesting...?
ggplot(data = tb_tidy, aes(x = year, y = e_mort_num)) +
  geom_line(aes(color = country))
