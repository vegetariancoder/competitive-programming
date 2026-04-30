s = "abcdab"

s_split = list(s.strip())

print(s_split)

cond = []

for i in range(len(s_split)):
    if s_split[i] == s_split[len(s_split)-1-i]:
        print(s_split[i], s_split[len(s_split) - 1 - i], i)
        cond.append(i)

if len(cond) > 0:
    print(min(cond))
else:
    print(-1)