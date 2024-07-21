nums = [1,1,1,1,1,1,1,1,1,1]
target = 1
start = 0
min_dist = float('inf')


for x in range(len(nums)):
    if nums[x] == target:
        distance = abs(x - start)

        min_dist = min(distance, min_dist)

print(min_dist)



