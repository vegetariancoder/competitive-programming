nums = [1,2,3,4,5,6]

result = 0

for values in nums:
    if values % 2 == 0:
        result |= values
print(result)

