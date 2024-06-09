import collections
import functools
import operator

nums = [1,2,2,1]
repeated = []
count_nums = collections.Counter(nums)

for number,count in count_nums.items():
    if count > 1:
        repeated.append(number)

if len(repeated) > 0:
    result = functools.reduce(operator.xor, repeated)
    print(result)
else:
    print(0)

print("3158. Find the XOR of Numbers Which Appear Twice".replace(" ","%20"))
print("3168. Minimum Number of Chairs in a Waiting Room".replace(" ","%20"))

