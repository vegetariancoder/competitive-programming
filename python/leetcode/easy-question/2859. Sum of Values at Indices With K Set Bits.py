nums = [1]
k = 0
sum = 0
for x in range(len(nums)):
    if bin(x).replace("0b","").count('1') == k:
        print(nums[x])
        sum +=nums[x]