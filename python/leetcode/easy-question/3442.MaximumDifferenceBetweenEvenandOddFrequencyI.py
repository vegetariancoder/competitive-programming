from collections import Counter

s = "abcabcab"
odd_max = []
even_max = []

list_s = list(s.strip())

count_s = Counter(list_s)

for key, value in count_s.items():
    if value % 2 != 0:
        odd_max.append(value)
    else:
        even_max.append(value)

result = max(odd_max) - min(even_max)
print(result)

