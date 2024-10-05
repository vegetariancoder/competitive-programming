a = 80
b = 120
count = 0

for values in range(a,b+1):
    split_values = [int(x) for x in str(values).strip()]
    set_split_values = set(split_values)
    if len(split_values)!= len(set_split_values):
        count += 1

result = ((b+1)-a)-count
print(result)