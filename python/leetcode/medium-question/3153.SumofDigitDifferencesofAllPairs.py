from itertools import combinations

nums  = [50,28,48]
sum_val = 0

pairs = list(combinations(nums, 2))


for pair in pairs:
    print(pair)

    for num in range(len(pair)-1):
        set1 = set(str(pair[num]))
        set2 = set(str(pair[num+1]))
        print(set1,set2)
        diff1_int = [int(char) for char in set1 - set2]
        diff2_int = [int(char) for char in set2 - set1]
        print(diff1_int,diff2_int)
        sum_diff1 = sum(diff1_int)
        sum_diff2 = sum(diff2_int)
        diff = abs(sum_diff1 - sum_diff2)
        sum_val += diff

print(sum_val)