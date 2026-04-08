nums = [4,1,2]
count = 0

for i in range(len(nums)):
    if len(nums[i+1:]) > 0 and nums[i] > sum(nums[i+1:])/len(nums[i+1:]):
        print(nums[i],nums[i+1:],sum(nums[i+1:])/len(nums[i+1:]))
        count+=1
print(count)