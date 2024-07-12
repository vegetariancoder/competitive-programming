import math

n = 123


if sum([int(math.pow(int(x),3)) for x in str(n)]) == n:
    print(True)
else:
    print(False)
