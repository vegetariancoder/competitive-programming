nums = [1,3,5,7]

answer = sum([nums[x] for x in range(len(nums)) if x%2==0]) - sum([nums[x] for x in range(len(nums)) if x%2!=0])
print(answer)