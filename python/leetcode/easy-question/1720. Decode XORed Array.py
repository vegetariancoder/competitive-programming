encoded = [1,2,3]
first = 1



answer = [first] + [first:= first^x for x in encoded]
print(answer)
