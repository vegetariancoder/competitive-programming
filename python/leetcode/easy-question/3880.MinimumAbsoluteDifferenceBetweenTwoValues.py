nums = [1,0,0,2,0,1]

min_diff = []
for i in range(0,len(nums)):
    for j in range(0,len(nums)):
        if nums[i]==1 and nums[j]==2:
            min_diff.append(abs(i-j))

if len(min_diff)>0:
    print(min(min_diff))
else:
    print(-1)