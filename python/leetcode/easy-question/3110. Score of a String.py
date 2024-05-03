s = "zaz"
sum_val = 0

s_list = [x for x in s.strip()]
for x in range(len(s_list)-1):
    sum_val += abs(ord(s_list[x]) - ord(s_list[x + 1]))

print(sum_val)


