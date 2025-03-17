nums = [1,3,2,1,5,4]
k = 2
sum_value = 0

for i in range(len(nums)):
    left = nums[i - k] if i - k >= 0 else 0
    right = nums[i + k] if i + k < len(nums) else 0
    # print(nums[i],left,right)
    if nums[i]>left and nums[i]>right:
        sum_value+=nums[i]

print(sum_value)

