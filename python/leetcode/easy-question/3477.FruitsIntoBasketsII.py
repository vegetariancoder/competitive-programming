fruits = [4,2,5]
baskets = [3,5,4]

alloted = 0

for i in range(len(fruits)-1):
    for j in range(len(fruits)-1):
        if fruits[i] <= baskets[j]:
            alloted +=1
            baskets[j]-=1
            break
print(len(fruits)-alloted)





