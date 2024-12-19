import math

n = 10
t = 2

numbers = [x for x in range(n,101)]
prod_nums = [(math.prod([int(x) for x in str(nums).strip("")]),nums) for nums in numbers if math.prod([int(x) for x in str(nums).strip("")])%t==0][0][1]

print(prod_nums)

