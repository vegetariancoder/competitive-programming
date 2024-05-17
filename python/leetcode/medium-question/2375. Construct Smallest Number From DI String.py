pattern = "IIIDIDDD"

answer = []
stack = []

for i in range(len(pattern)+1):
    stack.append(str(i+1))
    if i == len(pattern) or pattern[i] == 'I':
        while stack:
            answer.append(stack.pop())



print("".join(answer))

