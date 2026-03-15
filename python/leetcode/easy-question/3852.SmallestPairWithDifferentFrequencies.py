from collections import Counter

nums = [1,5]

counted_nums = Counter(nums)

smallest_freq = {}
answer = []

for num, freq in counted_nums.items():
    if freq not in smallest_freq or num < smallest_freq[freq]:
        smallest_freq[freq] = num
        answer.append(num)
print(answer)

if len(answer) == 1 or answer == nums:
    answer.clear()
    answer.append(-1)
    answer.append(-1)


print(answer)