nums = [1,1,1,2,2,3]
k = 2

d = {}
result = []
for num in nums:
    d[num] = d.get(num,0)+1
    if d[num] <= k:
        result.append(num)
print(result)