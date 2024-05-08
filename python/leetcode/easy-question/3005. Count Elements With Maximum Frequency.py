nums = [1, 2, 2, 3, 1, 4]

from collections import Counter

max_value_list = []
max_keys = []
counter_values = Counter(nums)

for key, value in counter_values.items():
    max_value_list.append(value)

max_val = max(max_value_list)

for key, value in counter_values.items():
    if value == max_val:
        max_keys.append(key)

answer = len([x for x in nums if x in max_keys])


