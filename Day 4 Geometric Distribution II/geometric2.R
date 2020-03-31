# Author: Alex Liu
# Last modified: 2020-03-31
# Description: This script solves the geometric distribution II problem on HackerRank

# Analysis ----------------------------------------------------------------

# Input:
# x = 0:4 a detect could occur in any of the 5 inspections 
# Probability is 1/3

result <- sum(dgeom(x = 0:4, prob = 1/3))

# Round number to 3 decimal places
write(round(result, 3), stdout())