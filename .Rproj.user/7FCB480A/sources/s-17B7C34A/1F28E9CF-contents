
# create a Lat Am grouping

gpi.world <- gpi.2019.data.data %>%
  mutate_if(is.double, as.numeric) %>%
  mutate(latam = ifelse(region %in% c("Central America and the Caribbean", "South America"), 1, 0 )) %>%
  mutate_at(vars(type, indicator, govt), tolower)

gpi.latam <- gpi.world %>%
  filter(latam == 1)

# what stats do I want?

# regional averages
regional.averages <- gpi.latam %>% 
  filter(type == "banded") %>%
  group_by(indicator, year) %>% 
  summarise(value = mean(value)) %>%
  ungroup()

region.chng <- change(regional.averages)

# avg country score change, 2008-2019, all indicators

trend <- change(gpi.latam)

# avg country score change, 2018-2019, all indicators

one.yr.chg <- change(gpi.latam, years = c(2018:2019))
  

# plot: trend in Cent Am, South Am, and Lat Am overall

