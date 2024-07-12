k = 3

list_k = [1] * k
print(list_k)
limit_value = int("".join([str(x) for x in list_k]))
print(limit_value)
values = []

for numbers in range(1, limit_value + 1):
    if numbers % k == 0 and all(digit == '1' for digit in str(numbers)):
        values.append(numbers)

if len(values)>0:
    print(len(str(values[0])))
else:
    print(-1)