s = "dart"
k = 3
result = []
s_list = list(s.strip(""))


for c in range(len(s_list)):
    result.append(s_list[(c + k) % len(s_list)])

print("".join(result))
