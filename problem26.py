#!/usr/bin/env python3
import time


def long_division(denominator):
    numerator = 1
    visited = []
    pattern = ''
    while numerator not in visited:
        visited.append(numerator)
        if numerator < denominator:
            numerator *= 10
            continue
        pattern += str(numerator // denominator)
        numerator = (numerator % denominator) * 10
    if numerator != 0:
        return pattern

result = None
max_pattern = ''
for x in range(7, 1001):
    pattern = long_division(x)
    if pattern and len(pattern) > len(max_pattern):
        result = x
        max_pattern = pattern

print(result)
