arr = [1,1,3,3,5,5,7,7]

count = 0
for number in arr:
    if number+1 in arr:
        count+=1

print(count)