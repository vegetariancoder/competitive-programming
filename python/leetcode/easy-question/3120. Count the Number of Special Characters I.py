word = "abBCab"

small_word_split = list(set([x for x in word.strip() if x.islower()]))
capital_word_split = [x.lower() for x in word.strip() if x.isupper()]
print(capital_word_split)
print(small_word_split)

result = len(list(set(capital_word_split).intersection(set(small_word_split))))
print(result)
print("3042. Count Prefix and Suffix Pairs I".replace(" ","%20"))