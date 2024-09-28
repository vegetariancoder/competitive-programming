nums = [2,1,3,5,6]
k = 5
multiplier = 2


for x in range(k):
    min_element = nums.index(min(nums))
    nums[min_element] *= multiplier
print(nums)