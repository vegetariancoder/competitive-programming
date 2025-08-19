nums = [3,5,4]

min_nums = min(nums)

actual_nums = [i for i in range(min_nums,min_nums +len(nums))]
print(actual_nums)

if sorted(nums) == actual_nums:
    print(True)
else:
    print(False)