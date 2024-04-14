s = "leetcode"

all_s = [s[x:x+2]for x in range(len(s)-1)]
all_reverse_s = [s[::-1][x:x+2]for x in range(len(s[::-1])-1)]
print(all_reverse_s)
print(all_s)

result = list(set(all_reverse_s).intersection(set(all_s)))
print(result)
print("3074. Apple Redistribution into Boxes".replace(" ","%20"))

