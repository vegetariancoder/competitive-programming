num = 8

num_1 = num + 1
num_2 = num + 2

num_1_pairs = []
num_2_pairs = []

for i in range(1, int(num_1 ** 0.5) + 1):
    if num_1 % i == 0:
        num_1_pairs.append((i, num_1 // i))

for i in range(1, int(num_2 ** 0.5) + 1):
    if num_2 % i == 0:
        num_2_pairs.append((i, num_2 // i))

all_pairs = num_1_pairs + num_2_pairs
closest_pair = min(all_pairs, key=lambda pair: abs(pair[0] - pair[1]))

print(all_pairs)

print(num_1_pairs)
print(num_2_pairs)
