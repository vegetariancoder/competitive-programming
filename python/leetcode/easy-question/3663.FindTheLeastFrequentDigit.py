from operator import itemgetter

n = 1553322
from collections import Counter

result = []

split_n = [int(x) for x in str(n).strip()]

counted = Counter(split_n)
min_count = min(counted.values())

for key,value in counted.items():
    if value == min_count:
        result.append(key)

print(min(result))