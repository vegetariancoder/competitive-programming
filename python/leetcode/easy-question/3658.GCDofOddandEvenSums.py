def greatest_common_divisor(a, b):
    # Loop until the remainder (b) is 0
    while b != 0:
        a, b = b, a % b
    return a

n = 501

odd_sum = sum([num for num in range(1,1002) if num % 2 != 0][:n])
even_sum = sum([num for num in range(1,1002) if num % 2 == 0][:n])

print(greatest_common_divisor(odd_sum, even_sum))

print(odd_sum)
print(even_sum)