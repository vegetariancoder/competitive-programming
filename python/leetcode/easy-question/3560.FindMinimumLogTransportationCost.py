n = 1
m = 4
k = 2
cost = 0

if n <= k and m <= k:
    print(cost)
elif n > k:
    len1 = 1
    len2 = n - len1
    cost = len1 * len2
elif m > k:
    len1 = 1
    len2 = m - len1
    cost = len1 * len2

print(cost)

