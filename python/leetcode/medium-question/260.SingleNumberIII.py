nums = [1,2,1,3,2,5]

from collections import Counter
answer = []

collected_nums = Counter(nums)

for number, count in collected_nums.items():
    print(number, count)
    if count == 1:
        answer.append(number)

print(answer)