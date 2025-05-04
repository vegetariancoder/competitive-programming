nums = [3,4,5,1,12,14,13]

prefix = []
prefix_sum = 0

if not nums:
    print(0)

prefix.append(nums[0])
prefix_sum=nums[0]
for i in range(1, len(nums)):
    if nums[i] == prefix[-1] + 1:
        prefix.append(nums[i])
        prefix_sum += nums[i]
    else:
        break

while prefix_sum in nums:
    prefix_sum+=1
print(prefix_sum)

