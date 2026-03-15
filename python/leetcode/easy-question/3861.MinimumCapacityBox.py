capacity = [1,5,3,7]
itemSize = 3

capacity_box = []

for elements in capacity:
    if itemSize <= elements:
        capacity_box.append(elements)
if len(capacity_box) == 0:
    print(-1)

capacity.index(min(capacity_box))
print(min(capacity_box))