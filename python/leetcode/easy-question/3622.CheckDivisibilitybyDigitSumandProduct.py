n = 8

import math

sum_val = sum([int(x) for x in list(str(n).strip())])

print(sum_val)
product = math.prod([int(x) for x in list(str(n).strip())])

print(product)

if n % (sum_val + product) == 0:
    print(True)
else:
    print(False)