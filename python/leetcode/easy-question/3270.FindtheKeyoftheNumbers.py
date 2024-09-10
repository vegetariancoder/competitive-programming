num1 = 1
num2 = 2
num3 = 3

result = []


padded_num1 = f"{num1:0>4}"
padded_num2 = f"{num2:0>4}"
padded_num3 = f"{num3:0>4}"

for x,y,z in zip(padded_num1,padded_num2,padded_num3):
    result.append(min(x,y,z))

print(int("".join(result)))


