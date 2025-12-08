nums = [4,4,5]

max_element = max(nums)
moves_needed = 0

for number in nums:
    moves_needed += abs(max_element-number)
print(moves_needed)
