nums = [4,3,1,6]



pairs = [(nums[i], nums[i + 1]) for i in range(len(nums) - 1)]
print(pairs)

for p in pairs:
    if (p[0]%2==0 and p[1]%2==0) or (p[0]%2!=0 and p[1]%2!=0):
        print(p[0], p[1])
