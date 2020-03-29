# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script solves the Day 3: Cards of the Same Suit problem on HackerRank

# Setup -------------------------------------------------------------------

remove(list = ls())

library(dplyr)

# Method 1 ----------------------------------------------------------------

# All permutation of drawing two cards 
(all_combo <- 52 * 51)

# There are 13 cards of the same suit. 
# Once one is drawn, there are 12 choices left. And there are 4 suits.
(favourable <- 13 * 12 * 4)

# Calculate probability
MASS::fractions(favourable/all_combo)

# Method 2 ----------------------------------------------------------------

# The first card came be anything.
# So the probability of drawing anything is 52/52 = 1

# Second card, there are 51 cards left and there are 12 cards of the same suit left. 
# Hence, 12/51

# probability is 1*(12/51) = 12/51
MASS::fractions(1 * (12 / 51))


