apple = [1, 3, 2]
capacity = [4, 3, 1, 5, 2]


capacity = sorted(capacity, reverse=True)
sum_apple = sum(apple)

i = 0

while sum_apple > 0:
    sum_apple -= capacity[i]
    i += 1

print(i)
