"""
This file contains several useful statistical functions, such as functions to calculate the mean, median, mode, and standard deviation of a set of numbers.

This code has a bug that makes stdev return improper results.  Test it on a smaller, representative data set to see why.
(try [2,4,4,5,4,7,9,5])
mean=5.0
median=4.5
mode=4
stdev=2.0
"""

import math
from collections import Counter
from numpy import loadtxt


def mean(t):
    total = sum(t)
    num = len(t)
    avg = total / num
    return avg


def median(t):
    t.sort()
    if (len(t) % 2 == 0):
        # Even case
        result = (t[len(t) / 2 - 1] + t[len(t) / 2]) / 2
    else:
        # Odd case
        result = t[len(t) / 2]
    return result


def mode(t):
    t.sort()
    count = Counter(t)
    return count.most_common(1)[0][0]


def stdev(t):
    avg = mean(t)
    numer = 0.0
    for i in t:
        numer += (i - avg) ** 2
    return math.sqrt(numer / avg)

# Read a list of numbers from the disk and calculate their mean, median,
# mode, and standard deviation.
nums = loadtxt('input.dat')
print "Mean:\t", mean(nums)
print "Median:\t", median(nums)
print "Mode:\t", mode(nums)
print "Standard Deviation:\t", stdev(nums)
