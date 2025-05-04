s = "abc"
answer = 0
index = 1

for char in s:
    answer += (123 - ord(char)) * index
    index += 1

print(answer)
