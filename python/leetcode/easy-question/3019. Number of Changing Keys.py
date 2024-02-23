s = "AaAaAaaA"

total_count = 0
count = 0
s = list(s.strip())
for x in range(len(s)-1):
    print(s[x], s[x + 1])
    total_count+=1
    if s[x].lower() == s[x+1] or s[x].upper() == s[x+1]:
        count+=1

answer = total_count - count
print(answer)
