from collections import Counter

text = "leetcode"

key_count = []
word_occ = []

split_text = list(text.strip())
word_count = Counter(split_text)


for key,count in word_count.items():
    if key in ['b','a','l','l','o','o','n']:
        key_count.append(key)
        word_occ.append(count)

if len(key_count) == 5:
    print(min(word_occ))
else:
    print(-1)