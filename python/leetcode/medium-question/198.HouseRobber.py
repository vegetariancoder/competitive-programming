nums = [1,2,3,1]

prev1, prev2 = 0,0
for num in nums:
    current = max(prev1,prev2+num)
    prev2,prev1 = current,prev1
print(prev1)