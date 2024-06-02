word = "234Adas"

if len(word) > 3 and any(ch.isdigit() for ch in word) and any(ch.isdigit() for ch in word if ch in ['a', 'e', 'i', 'o', 'u']) and any(ch.isdigit() for ch in word if ch not in ['a', 'e', 'i', 'o', 'u']):
    print(True)
else:
    print(False)

print("3136. Valid Word".replace(" ","%20"))
print("2644. Find the Maximum Divisibility Score".replace(" ","%20"))
