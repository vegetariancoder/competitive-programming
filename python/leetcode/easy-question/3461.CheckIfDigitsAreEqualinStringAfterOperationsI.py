s = "3902"

s_list = list(s)

result = []
while len(result) == 2:
    for i in range(len(s_list)-1):
        result.append(int(s_list[i]) + int(s_list[i+1]) % 10)

    for i in range(len(result)-1):
        result.append(int(s_list[i]) + int(s_list[i+1]) % 10)

print(result)