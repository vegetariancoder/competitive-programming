nums = [99]
k = 99

all_nums = [x*k for x in range(1,len(nums)+2)]
print(all_nums)

missing_nums = list(set(all_nums) - set(nums))
print(missing_nums)
print(min(missing_nums))