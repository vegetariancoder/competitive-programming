rotation_map = {'0': '0', '1': '1', '6': '9', '8': '8', '9': '6'}

n = 11
rotated_list = []

split_n = [x for x in str(n).strip()]


for _ in split_n:
    value = int(rotation_map.get(_,None))
    rotated_list.append(value)

rotated_n = int("".join([str(x) for x in rotated_list]))

if n != rotated_n:
    print("True")
else:
    print("False")
