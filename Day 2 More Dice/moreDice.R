# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script finds the probility that the values of two dices are different nd have the sum of 6

# Setup -------------------------------------------------------------------

remove(list = ls())

library(dplyr)
library(stringr)

# Analysis ----------------------------------------------------------------

# Generate all possible outcomes
n_all <- expand.grid(dice_1 = c(1:6),
                     dice_2 = c(1:6))

# Filter out same values and calculate the number of instances where the sum is exactly 6
(n_favourable <- n_all %>% 
                # Filter out same values
                filter(dice_1 != dice_2) %>% 
                # Calculate sum and filter on sum equals 6
                mutate(total = dice_1 + dice_2) %>% 
                filter(total == 6))

# Calculate probability
MASS::fractions(nrow(n_favourable)/nrow(n_all))



