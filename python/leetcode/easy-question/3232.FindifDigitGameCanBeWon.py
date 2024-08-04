nums = [1, 2, 3, 4, 10]

sum_all_single = sum([x for x in nums if len(str(x)) == 1])
sum_all_double = sum([x for x in nums if len(str(x)) >= 2])

print(sum_all_double)
print(sum_all_single)

if sum_all_double == sum_all_single:
    print("False")
else:
    print("True")