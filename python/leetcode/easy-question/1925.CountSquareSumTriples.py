import math

n = 10
count = 0

list_n = [x+1 for x in range(0,n)]
print(list_n)

for x in list_n:
    for y in list_n:
        for z in list_n:
            if math.pow(x,2) + math.pow(y,2) == math.pow(z,2):
                count+=1

print(count)