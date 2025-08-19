from collections import Counter
s = "abcba"
target = "abc"


count_s = Counter(s)
answer = min([count_s[t]//count for t,count in Counter(target).items()])


print(answer)

