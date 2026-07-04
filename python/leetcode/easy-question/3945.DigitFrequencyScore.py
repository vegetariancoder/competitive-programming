from collections import Counter

n = 101
answer = 0
for key,value in Counter(str(n)).items():
    answer += int(key)*int(value)

print(answer)