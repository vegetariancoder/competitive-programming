nums = [-38,-44,-37]

max_result = []
nums = sorted(nums)
a = nums.pop(-1)
b = nums.pop(-1)
print(a,b)
print(nums)

for numbers in nums:
    result = a+b-numbers
    max_result.append(result)
print(max(max_result))