s1 = "abc"
s2 = "abb"
s3 = "ab"
count = 0

if not s1[0] == s2[0] == s3[0]:
    print(-1)
for ch1, ch2, ch3 in zip(s1, s2, s3):
    if not (ch1 == ch2 == ch3):
        break
    count += 1

print(count)
