nums = [1,2,3,4,5]
k = 2

from collections import Counter

nums_cnt = Counter(nums)


all_values = [key for key, value in Counter(nums).items() if value % k == 0]

answer = sum([elements for elements in nums if elements in [key for key, value in Counter(nums).items() if value % k == 0]])
print(answer)