from collections import Counter

s = "aeiaeia"
max_item_vowels = 0
max_item_non_vowels = 0
list_s_vowels = [char for char in s.strip("") if char in ['a', 'e', 'i', 'o', 'u']]
list_s_non_vowels = [char for char in s.strip("") if char not in ['a', 'e', 'i', 'o', 'u']]

counter_vowel = Counter(list_s_vowels)

if len(counter_vowel) > 0:
    max_item_vowels = counter_vowel.most_common(1)[0][1]
counter_non_vowel = Counter(list_s_non_vowels)
if len(counter_non_vowel) > 0:
    max_item_non_vowels = counter_non_vowel.most_common(1)[0][1]

print(max_item_vowels)
print(max_item_non_vowels)
