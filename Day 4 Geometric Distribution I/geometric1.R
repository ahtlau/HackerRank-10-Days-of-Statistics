# Author: Alex Liu
# Last modified: 2020-03-31
# Description: This script solves the geometric distribution I problem on HackerRank

# Analysis ----------------------------------------------------------------

# Input:
# x = 4 because that is the number of consecutive failures required before the 1st success on the 5th inspection
# Probability is 1/3

result <- dgeom(x = 4, prob = 1/3)

# Round number to 3 decimal places
write(round(result, 3), stdout())