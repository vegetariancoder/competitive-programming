nums = [5,4,2,3]

nums.sort()
for x in range(0,len(nums),2):
    nums[x],nums[x+1] = nums[x+1],nums[x]

print(nums)