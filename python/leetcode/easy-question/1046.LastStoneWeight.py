stones = [7, 6, 7, 6, 9]

for x in range(len(stones)):
    stones.sort()
    first_max = stones[-1]
    if len(stones) > 1:
        second_max = stones[-2]
        smash = abs(second_max - first_max)
        stones.remove(first_max)
        stones.remove(second_max)
        stones.append(smash)

print(stones)
