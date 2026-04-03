# practice filtering ---
body_mass_df <- penguins %>% 
  filter(body_mass_g %in% c(3000:4000))