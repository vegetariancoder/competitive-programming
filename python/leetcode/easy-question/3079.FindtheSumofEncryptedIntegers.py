nums = [109]
sum = 0

for num in nums:
    num_str = str(num)
    max_dig = max(num_str)
    new_num = max_dig*len(num_str)
    print(new_num)
    sum += int(new_num)

print(sum)


