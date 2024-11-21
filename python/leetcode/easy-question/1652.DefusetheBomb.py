code = [2,4,9,3]
k = -2

result = []
for i in range(len(code)):
    if k>0:
        next_items = sum([code[(i + j + 1) % len(code)] for j in range(k)])
    else:
        next_items = sum([code[(i - j - 1) % len(code)] for j in range(abs(k))])
    result.append(next_items)

print(result)