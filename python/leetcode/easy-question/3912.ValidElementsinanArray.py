nums = [1]
result = []

for num in range(len(nums)):
    print(nums[num], nums[num+1:])
    if all(nums[num] > x for x in nums[:num]) or all(nums[num] > x for x in nums[num+1:]):
        result.append(nums[num])



print(result)
