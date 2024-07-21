# check the sum of minimum element is odd then return 1 else 0
nums = [23, 65, 87, 2, 98, 19]


def min_num(nums):
    n = min(nums)
    n_list = str(n).split()
    output = sum([int(nl) for nl in n_list])
    if output % 2 == 0:
        return 1
    return 0


print(min_num(nums))
