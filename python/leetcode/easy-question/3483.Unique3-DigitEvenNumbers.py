from itertools import permutations

digits = [6,6,6]

even_numbers = []

for perm in permutations(digits,3):
    if perm[-1] % 2 ==0:
        number = int(''.join(map(str, perm)))
        if len(str(number)) >= 3:
            even_numbers.append(number)

print(even_numbers)

print(len(set(even_numbers)))