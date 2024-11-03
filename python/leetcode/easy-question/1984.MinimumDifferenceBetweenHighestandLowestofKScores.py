import itertools

nums = [9,4,1,7]
k = 2

if k == 1:
    print(0)
else:
    combinations = [list(x) for x in list(itertools.combinations(nums,k))]
    differences = [abs(sublist[0] - sublist[1]) for sublist in combinations]
    print(min(differences))