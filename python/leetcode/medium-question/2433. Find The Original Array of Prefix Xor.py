pref = [5, 2, 0, 3, 1]
answer = [pref[x] ^ pref[x + 1] for x in range(len(pref) - 1)]
answer.insert(0,pref[0])
print(answer)

print("2433. Find The Original Array of Prefix Xor".replace(" ","%20"))
