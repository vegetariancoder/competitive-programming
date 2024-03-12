key = "the quick brown fox jumps over the lazy dog"
message = "vkbs bs t suepuv"

result = []
d = {' ': ' '}
c = 97

for i in range(len(key)):
    if key[i] not in d:
        d[key[i]] = chr(c)
        c += 1

for word in message.split(" "):
    word = "".join([d[x] for x in word.strip()])
    result.append(word)

print(" ".join([x for x in result]))
print("2325. Decode the Message".replace(" ","%20"))

