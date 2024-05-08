nums = [-7, 10]


start_index = 0
count = 0

for x in range(len(nums)):
    start_index += nums[x]
    if start_index == 0:
        count+=1

print(count)
