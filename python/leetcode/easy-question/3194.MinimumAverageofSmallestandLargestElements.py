nums = [7,8,3,4,15,13,4,1]

avg = []


while len(nums) > 0:
    min_element = min(nums)
    max_element = max(nums)
    nums.remove(min_element)
    nums.remove(max_element)
    avg_value = (max_element + min_element) / 2
    avg.append(avg_value)

print(min(avg))