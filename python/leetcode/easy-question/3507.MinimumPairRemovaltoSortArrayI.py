nums = [5,2,3,1]

res = 0
min_val = float('inf')
idx = 0

while sorted(nums) != nums:
    for i in range(len(nums)-1):
        if nums[i] + nums[i+1] < min_val:
            min_val = nums[i] + nums[i+1]
            idx = i
    nums.pop(idx)
    nums[idx] = min_val
    min_val,idx = float('inf'),0
    res += 1

print(res)

