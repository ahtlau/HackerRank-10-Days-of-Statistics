# Author: Alex Liu
# Last modified: 2020-03-31
# Description: This script solves the binominal distribution II problem

# Analysis ----------------------------------------------------------------

# Create a vector where results will be saved
result <- c()

# Find the probability that there are no more than 2 defects
result[1] <- sum(dbinom(x = 0:2, size = 10, prob = 0.12))

# Find the probability that there are at least 2 defects
result[2] <- sum(dbinom(x = 2:10, size = 10, prob = 0.12))

# Round results and print them vertically
write(paste(round(result, 3), collapse = "\n"), stdout())