nums = [5,4,3,8]


nums_1 = []
nums_2 = []

for x in range(len(nums)):
    if x == 0:
        nums_1.append(nums[0])

    elif x ==1:
        nums_2.append(nums[1])

    elif nums_1[-1]>nums_2[-1]:
        nums_1.append(nums[x])

    elif nums_1[-1]<nums_2[-1]:
        nums_2.append(nums[x])


answer = nums_1+nums_2
print(answer)


print(nums_1)
print(nums_2)
