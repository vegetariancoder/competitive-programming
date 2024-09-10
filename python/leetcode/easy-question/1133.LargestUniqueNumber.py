from collections import Counter

nums = [9,9,8,8]
single_element = []

nums_dict = Counter(nums)

for key,value in nums_dict.items():
    if value == 1:
        single_element.append(key)
if len(single_element) > 0:
    print(max(single_element))
else:
    print(-1)