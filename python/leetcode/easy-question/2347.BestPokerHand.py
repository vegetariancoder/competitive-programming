ranks = [10,10,2,12,9]; suits = ["a","b","c","a","d"]

from collections import Counter

set_suits = set(suits)
rank_counts = Counter(ranks).values()
if len(set_suits) == 1:
    print("Flush")
elif any(count >= 3 for count in rank_counts):
    print("Three of a Kind")
# Check if ANY of the counts is exactly 2
elif any(count == 2 for count in rank_counts):
    print("Pair")
else:
    print("High Card")


for key,value in Counter(ranks).items():
    print(key, value)



