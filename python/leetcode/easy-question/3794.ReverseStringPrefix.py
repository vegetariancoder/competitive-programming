s = "hey"
k = 1

s_split = list(s.strip())
print(s_split)
s_reverse = s_split[:k][::-1]
print(s_reverse)
s_normal = s_split[k:]
print(s_normal)

answer = "".join(s_reverse + s_normal)
print(answer)
