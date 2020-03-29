# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script solves the Day 3: Drawing Marbles problem on HackerRank

# Setup -------------------------------------------------------------------

remove(list = ls())

library(gtools)
library(dplyr)

# Method ------------------------------------------------------------------

# Recall formula Prob = n_favourable / n_all

# Exam question: what is the conditional probability of drawing a blue ball after drawing a red ball
# in a bag that has 3 red balls and 4 blue balls?

# The first ball must be red and there are 3 possible choices (e.g. R1, R2, R3)
# In the second draw, there are 6 balls left. 
# Hence the number of all cases is:

(n_all <- 3 * 6)

# In the second draw, possible permutation can be R1B1, R1B2, R1B3 and etc,.
# And the number of all favourable cases is the count of all these cases.
# The easier way is to subtract all cases where the second ball is red from all cases.
# There are 2 red balls left in the second darw, and the first draw can be any of the 3 red balls. So: 

(n_favourable <- n_all - 3 * 2)

# Probability is then:
MASS::fractions(n_favourable/n_all)






