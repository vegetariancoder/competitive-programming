boxes = "110"

boxes_split = list(boxes.strip(""))
all_indexes = []
resArray = []


for i in range(len(boxes_split)):
    if boxes_split[i] == "1":
        all_indexes.append(i)


# print(boxes_split)
# print(all_indexes)

for i in range(len(boxes)):
    cSum = 0
    for values in all_indexes:
        cSum += abs(i - values)
    resArray.append(cSum)

print(resArray)


