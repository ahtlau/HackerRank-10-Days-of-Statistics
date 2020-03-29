# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script solves the Day 3: Conditional Probability problem on HackerRank

# Setup -------------------------------------------------------------------

remove(list = ls())

library(stringr)
library(dplyr)

# Method 1 ----------------------------------------------------------------

# Find all cases where there is at least one boy
(all_conditional <- expand.grid(first = c("B", "G"), 
                                second = c("B", "G")) %>% 
   # Filter on when both children are girls
   filter(!(first == "G" & second == "G")))

# Find the number of cases when both are boys
(favourable_conditional <- all_conditional %>% 
    filter(first == "B" & second == "B"))

# Calculate probability and express it in fraction 
MASS::fractions(nrow(favourable_conditional)/nrow(all_conditional))

# Method 2 ------------------------------------------------------

# Assign e probability of having a boy/girl
(prob <- 0.5)

# Find the probability of having two boys. 
# The events are independent hence probability can be multipled together
(prob_bb <- prob^2)

# Find the probability of having at least 1 boy. 
# This is 1 less the probability of having two girls 
(prob_at_least_1_b <- 1 - prob^2)

# Calculate probability and express it in fraction 
MASS::fractions(prob_bb / prob_at_least_1_b)



