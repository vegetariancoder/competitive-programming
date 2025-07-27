nums = [1,3,2,1,3,2,2]

from collections import Counter
answer = []
count_pair = 0
count_leftover = 0


for key,value in Counter(nums).items():
    print(key," with pair : ",value//2, "leftover : ", value%2)
    count_pair += value//2
    count_leftover += value%2

print(count_pair)
print(count_leftover)

answer.append(count_pair)
answer.append(count_leftover)

print(answer)
