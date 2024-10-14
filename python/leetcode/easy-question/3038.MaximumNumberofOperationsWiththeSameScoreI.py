nums = [3,2,1,4,5]


addition = nums[0] + nums[1]
count = 0

for numbers in range(2,len(nums)-1,2):
    if nums[numbers] + nums[numbers+1] == addition:
        count+=1
    else:
        break

print(count)



