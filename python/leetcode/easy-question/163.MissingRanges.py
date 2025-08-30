nums = [0,1,3,50,75]
lower = 0
upper = 99
ans = []

from itertools import tee

def pairwise(iterable):
    """Return successive pairs from an iterable."""
    a, b = tee(iterable)
    next(b, None)
    return zip(a, b)

for a, b in pairwise(nums):
    print(a,b)
    if b-a>1:
        ans.append([a+1,b-1])

print(ans)


