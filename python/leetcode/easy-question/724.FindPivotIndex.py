nums = [2,1,-1]

left_sum = 0

for element in range(len(nums)):
    if left_sum == sum(nums)-left_sum-nums[element]:
        print(element)
        break
    left_sum += nums[element]
print(-1)