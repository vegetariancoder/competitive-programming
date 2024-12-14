nums = [1,0,2,0,3]

sum_nums = sum(nums)
var_zero = 0
count = 0

for num in nums:
    if num > 0:
        var_zero+=num
        sum_nums -=num
    elif num == 0:
        if var_zero == sum_nums:
            count+=2
        elif abs(var_zero-sum_nums)==1:
            count+=1
print(count)

