nums = [1]

distance = []
for i in range(len(nums)-1):
    for j in range(i+1,len(nums)):
        for k in range(j+1,len(nums)):
            if nums[i] == nums[j] == nums[k]:
                # print(nums[i],nums[j],nums[k])
                # print(abs(i - j) + abs(j - k) + abs(k - i))
                distance.append(abs(i - j) + abs(j - k) + abs(k - i))

if len(distance) > 0:
    print(min(distance))
else:
    print(-1)


