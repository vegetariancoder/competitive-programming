n = 886996
sum_even = 0
sum_odd = 0

split_n = [int(x) for x in str(n).strip()]
for index,number in enumerate(split_n):
    if index%2==0:
        sum_even+=number
    else:
        sum_odd+=number

result = sum_even -sum_odd
print(result)

