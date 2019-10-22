# Kelsie Fronheiser
# Nice header

library(tidyverse)
library(here)
library(janitor)

disease_burden <- read_csv(here("data", "disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(death_per_100k = death_rate_per_100_000)

db_sub <- disease_burden %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days", sex == "Both")

# Graph

ggplot(data = db_sub, aes(x = year, y = death_per_100k)) +
  geom_line(aes(color = country_name))

ggsave(here::here("Final Graphs", "disease_graph.png"))
