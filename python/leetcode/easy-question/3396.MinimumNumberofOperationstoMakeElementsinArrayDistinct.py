nums = [6,7,8,9]
cnt = 0

if len(set(nums)) == len(nums):
    print(0)
else:
    while nums:
        nums = nums[3:] if len(nums) >= 3 else []
        cnt += 1
        if len(set(nums)) == len(nums):
            break

print(cnt)
    