nums = [1]

left = [0]
right = [0]
sum_left = 0
sum_right = 0

for x in nums:
    sum_left+=x
    left.append(sum_left)

for x in nums[::-1]:
    sum_right+=x
    right.append(sum_right)

left = left[:len(nums)]
right = right[:len(nums)][::-1]


result = [abs(a_i-b_i) for a_i,b_i in zip(left,right)]
print(result)