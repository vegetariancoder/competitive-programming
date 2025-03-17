nums  = [3,1,1,2]

sum_value = 0

for i in range(len(nums)):
    start = max(0, i - nums[i])
    sum_value += sum(nums[start : i+1])
print(sum_value)