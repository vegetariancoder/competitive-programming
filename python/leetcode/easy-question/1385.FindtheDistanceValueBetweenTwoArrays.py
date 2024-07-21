arr1 = [4, 5, 8]
arr2 = [10, 9, 1, 8]
d = 2
not_selected = set()

for x in range(len(arr1)):
    for y in range(len(arr2)):
        if abs(arr1[x] - arr2[y]) <= d:
            not_selected.add(arr1[x])

answer = len(set(arr1) - not_selected)
print(answer)