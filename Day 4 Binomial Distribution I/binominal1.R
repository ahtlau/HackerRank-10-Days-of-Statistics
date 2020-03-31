# Author: Alex Liu
# Last modified: 2020-03-31
# Description: This script solves the Day 4: Binomial Distribution I problem. 
 
# Analysis ----------------------------------------------------------------

# Input: 
# x is the number of boys. It ranges from 3 to 6 in this problem. 
# size (or the number of trials, n) is 6
# probability of success is 1.09/2.09 (given)

# Calculate the proportion of Russian families with exactly 6 children will have at least 3 boys
result <- sum(dbinom(x = 3:6, size = 6, prob = 1.09/2.09))

# Round result
write(round(result, 3), stdout())
