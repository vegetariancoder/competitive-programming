matrix = [[3,-1],[5,2]]
max_len = len(matrix)
index_element = 0

for rows in matrix:
    for element in rows:
        if element == -1:
            index_element = rows.index(element)
        values = [x[index_element] for x in matrix]
        if element == -1:
            rows[index_element] = max(values)

print(matrix)
print("3069. Distribute Elements Into Two Arrays I".replace(" ","%20"))