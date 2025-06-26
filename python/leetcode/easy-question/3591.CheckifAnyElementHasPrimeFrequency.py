import math
from collections import Counter

nums = [1,2,3,4,5,4]

def is_prime(num):
    if num <= 1:
        return False
    if num == 2:
        return True
    if num % 2 == 0:
        return False
    for i in range(3, int(math.sqrt(num)) + 1, 2):
        if num % i == 0:
            return False # Found a divisor, so it's not prime

    # If no divisors were found, the number is prime.
    return True

for num,frequency in Counter(nums).items():
    if is_prime(frequency):
        print("True")
        break