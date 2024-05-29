nums = [69,3,92,14,67,90,31,40,54,63,99,88,28,100,5,72,89,60,90,71]
divisors = [97,16,7,60,6,57,73,84,17,8,77,60,7,74,74,24,52,43,94,48,9,99]

divisors_count = {divisor: 0 for divisor in divisors}

for num in nums:
    for divisor in divisors:
        if num % divisor == 0:
            divisors_count[divisor] += 1
divisors_count = dict(sorted(divisors_count.items()))
print(divisors_count)
answer = max(divisors_count, key=divisors_count.get)
print(answer)
