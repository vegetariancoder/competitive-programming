from collections import Counter

nums = [1,2,2,3,1,4,2]
answer = []



nums_count = Counter(nums)

max_freq = max(nums_count.values())
result = [key for key, value in nums_count.items() if value == max_freq]
for numbers in result:
    min_index = nums.index(numbers)
    max_index = len(nums) - 1 - nums[::-1].index(numbers)
    max_minus_min = abs(max_index - min_index)+1
    answer.append(max_minus_min)



