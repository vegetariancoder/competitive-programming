nums = [84,93,100,77,93]
k = 3

nums = sorted(list(set(nums)),reverse=True)[:k]
print(nums)

