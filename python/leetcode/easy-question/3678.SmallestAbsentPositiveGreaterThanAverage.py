nums = [1,-39,9]

avg = sum(nums) / len(nums)

numbers = [x for x in range(0, max(nums)+2)]

for x in numbers:
    if x > avg and x not in nums:
        print(x)
        break

