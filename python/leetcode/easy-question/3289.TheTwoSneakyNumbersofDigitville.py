nums = [0,1,1,0]
verdict_elements = []

from collections import Counter

counter_nums = Counter(nums)

for key, value in counter_nums.items():
    if value >=2 :
        verdict_elements.append(key)

print(verdict_elements)
