blacks = ['a','c','e','g','1','3','5','7']

coordinate1 = "a1"
coordinate2 = "c3"

column_cord_1 = coordinate1[0].upper()
row_cord_1 = int(coordinate1[1])
column_num_cord_1 = ord(column_cord_1) - ord('A') + 1
if (column_num_cord_1 + row_cord_1) % 2 == 0:
    color_cord_1 = "white"
else:
    color_cord_1 = "black"

print(color_cord_1)


column_cord_2 = coordinate2[0].upper()
row_cord_2 = int(coordinate2[1])
column_num_cord_2 = ord(column_cord_2) - ord('A') + 1
if (column_num_cord_2 + row_cord_2) % 2 == 0:
    color_cord_2 = "white"
else:
    color_cord_2 = "black"

print(color_cord_2)


one = ord(coordinate1[0]) + int(coordinate1[1])
two = ord(coordinate2[0]) + int(coordinate2[1])
print(one)
print(two)

    # Return true if both sums have the same parity
