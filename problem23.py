#!/usr/bin/env python3
import math
import itertools


def sum_of_divisors(x):
    sum_ = 1
    for y in range(2, int(math.sqrt(x)) + 1):
        if x % y == 0:
            sum_ += y
            quot = x / y
            if quot != y:
                sum_ += quot
    return sum_


all_abundant = [x for x in range(1, 28123 + 1) if sum_of_divisors(x) > x]
sum_of_abundants = [False for x in range(28123 + 1)]

for idx, x in enumerate(all_abundant):
    for y in all_abundant[idx:]:
        sum_ = x + y
        if sum_ <= 28123:
            sum_of_abundants[x + y] = True

result = 0
for idx, is_sum in enumerate(sum_of_abundants):
    if not is_sum:
        result += idx

print(result)
