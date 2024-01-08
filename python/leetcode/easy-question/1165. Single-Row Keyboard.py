keyboard = "pqrstuvwxyzabcdefghijklmno"
word = "leetcode"

keyboard = list(keyboard.strip())
word = list(word.strip())
previous_index = 0
answer = []


for x in word:
    current_index = keyboard.index(x)
    result = abs(current_index-previous_index)
    answer.append(result)
    previous_index = current_index

print("2824. Count Pairs Whose Sum is Less than Target".replace(" ","%20"))