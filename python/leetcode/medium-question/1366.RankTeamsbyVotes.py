votes = ["WXYZ", "XYZW"]
from collections import Counter

d = {}

for vote in votes:
    for i, char in enumerate(vote):
        if char not in d:
            d[char] = [0] * len(vote)
        d[char][i] += 1

print(d)
voted_names = sorted(d.keys())
print(voted_names)
print("".join(sorted(voted_names,key=lambda x:d[x],reverse=True)))
