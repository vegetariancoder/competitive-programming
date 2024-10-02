nums = [10, 12, 13, 14]
new_nums = []


for x in nums:
    nums = sum([int(x) for x in str(x).strip()])
    new_nums.append(nums)
print(min(new_nums))