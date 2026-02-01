nums = [5,2,2,4]
k = 2


if len(nums)==1:
    print(0)
else:
    nums.sort()
    print(nums)
    print(sum(nums[:k]))
    reverse_nums = nums[::-1]
    print(sum(reverse_nums[:k]))
    answer = abs(sum(nums[:k]) - sum(reverse_nums[:k]))
    print(answer)