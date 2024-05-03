from itertools import combinations

words = ["a","aba","ababa","aa"]
count = 0


for pref_word, word in combinations(words, 2):
  count += word.startswith(pref_word) and word.endswith(pref_word)

print(count)

