s = "cb34"

result = []
list_s = list(s.strip())


for element in list_s:
    if element.isdigit():
        if result and result[-1].isalpha():
            result.pop()
    else:
        result.append(element)

print("".join(result))
print("3174. Clear Digits".replace(" ","%20"))

