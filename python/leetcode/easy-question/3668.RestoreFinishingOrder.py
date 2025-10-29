order = [3,1,2,5,4]
friends = [1,3,4]
result = [elements for elements in order if elements in friends]

for elements in order:
    if elements in friends:
        result.append(elements)

print(result)