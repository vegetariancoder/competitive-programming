n = 3
k = 5

position = 0
direction = 1

for _ in range(k):
    position += direction
    if position == 0:
        direction = 1
    elif position == n - 1:
        direction = -1
print(position)
