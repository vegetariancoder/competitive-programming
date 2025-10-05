nums = [1,0,0,0,1,0,0,1]; k = 2


indices = [i for i,number in enumerate(nums) if number == 1]
print(indices)

for values in range(len(indices)-1):
    print(indices[values],indices[values+1])
    if abs(indices[values+1] - indices[values])-1 < k:
        print(False)
