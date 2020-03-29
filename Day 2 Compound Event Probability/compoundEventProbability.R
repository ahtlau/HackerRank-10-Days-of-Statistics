# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script finds the probility that one can get 2 red and 1 black balls from 3 draws from 3 urns 

# Setup -------------------------------------------------------------------

remove(list = ls())

library(reshape2)
library(MASS)
library(stringr)
library(dplyr)

# Method 1 ----------------------------------------------------------------

# Create all possible outcomes
n_all <- expand.grid(x = c(rep("R", 4), rep("B", 3)),
                     y = c(rep("R", 5), rep("B", 4)),
                     z = c(rep("R", 4), rep("B", 4)))

# Determine favourable outcomes
n_favourable <- n_all %>%
        mutate(flag = paste0(x, y, z)) %>%
        # Filter out cases where there are 3 R's
        filter(!str_detect(flag, "R{3}")) %>%
        # Filter on cases where there are only 2 R's
        filter(str_detect(flag, "R{2}|R.R"))

# Calculate probability
fractions(nrow(n_favourable)/nrow(n_all))

# Method 2 (more verbose) ----------------------------------------------------------------

# # Create a summary of table
# (table <- data.frame(urn = c("x", "y", "z"),
#                      R = c(4, 5, 4),
#                      B = c(3, 4, 4),
#                      stringsAsFactors = F))
# 
# # Calculate the probability of each color in each urn
# (table_prob <- table %>% 
#                 mutate(sum = R + B,
#                        R = R/sum,
#                        B = B/sum) %>% 
#                 select(-sum) %>% 
#                 melt(id = c("urn"), value.name = "prob") %>% 
#                 mutate(variable = as.character(variable)) %>% 
#                 rename("color" = variable) %>% 
#                 arrange(urn))
# 
# # Calculate probability
# (temp <- expand.grid(x = c("R", "B"),
#                      y = c("R", "B"),
#                      z = c("R", "B"),
#                      stringsAsFactors = F) %>%
#                 mutate(flag = paste0(x, y, z)) %>% 
#                 # Filter out cases where there are 3 R's
#                 filter(!str_detect(flag, "R{3}")) %>% 
#                 # Filter on cases where there are only 2 R's
#                 filter(str_detect(flag, "R{2}|R.R")) %>% 
#                 select(-flag) %>% 
#                 mutate(case = row.names(.)) %>% 
#                 melt(id = c("case"), value.name = "color") %>% 
#                 rename("urn" = variable) %>% 
#                 mutate(color = as.character(color),
#                        urn = as.character(urn)) %>% 
#                 left_join(table_prob, by = c("color", "urn")) %>% 
#                 group_by(case) %>% 
#                 summarise(prob = prod(prob)) %>% 
#                 pull() %>% 
#                 sum() %>% 
#                 fractions())



