nums = [7,8,9,11,12]


all_nums = [x for x in range(1,1000000)]

missing_nums = list(set(all_nums) - set(nums))[:10]
print(missing_nums)
print(missing_nums[0])
