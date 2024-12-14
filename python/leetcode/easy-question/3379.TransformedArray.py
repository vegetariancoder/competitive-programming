result = []
nums = [3,-2,1,1]

for i in range(len(nums)):
    new_idx = (i+nums[i]) % len(nums)
    result.append(nums[new_idx])