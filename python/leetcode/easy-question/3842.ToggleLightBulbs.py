from collections import Counter

bulbs = [1,1,1]
result = []
counter_bulbs = Counter(bulbs).items()

for key,value in counter_bulbs:
    if value %2== 1:
        result.append(key)

print(sorted(result))