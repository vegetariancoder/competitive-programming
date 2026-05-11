nums = [5,0,1,4]
k = 3
stable = []

for i in range(0,len(nums)):
    if max(nums[0:i+1])-min(nums[i:]) <= k:
        stable.append(i)

if len(stable) > 0:
    print(min(stable))
else:
    print(-1)



print(stable)
