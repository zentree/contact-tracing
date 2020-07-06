library(readr)
library(dplyr)
library(ggplot2)

tracers <- read_csv('contact-tracers.csv')
tracers <- tracers %>% 
  mutate(date = as.Date(date))

# Plot by contact tracing unit
ggplot(tracers, aes(x = date, y = tracers)) + geom_line() +
  facet_wrap(~ dhb) + theme_minimal()

# Total effort
tracers %>% 
  group_by(date) %>% 
  summarise(tracers_sum = sum(tracers, na.rm = TRUE)) -> total_tracers

ggplot(total_tracers, aes(x = date, y = tracers_sum)) + geom_line() +
  labs(y = 'total number of contact tracers') + theme_minimal()

