s = "au 123"

s_split = list("".join(s.split()))
# print(s_split)
v = len([x for x in s_split if x in ['a', 'e', 'i', 'o', 'u']])
c = len([x for x in s_split if x not in ['a', 'e', 'i', 'o', 'u'] and not x.isdigit()])

print(v,c)
if c>0:
    answer = v//c
else:
    answer = 0
print(answer)