nums = [1, 4, 2, 5]

all_nums = [x for x in range(min(),max(nums)+1)]
print(all_nums)
result = list(set([x for x in range(1,max(nums)+1)]) - set(nums))
print(result)

