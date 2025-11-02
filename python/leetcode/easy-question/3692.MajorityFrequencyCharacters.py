from collections import Counter, defaultdict

s = "aaabbbccdddde"

from collections import Counter, defaultdict

s = "aalbs"

# Count characters
cnt = Counter(s)

# Group by frequency: k -> [chars]
groups = defaultdict(list)
for ch, k in cnt.items():
    groups[k].append(ch)

# Find the k whose group is largest; tie-break by larger k
best_k = max(groups.keys(), key=lambda k: (len(groups[k]), k))

# Return the characters in that group in any order
result = ''.join(groups[best_k])
print(result)