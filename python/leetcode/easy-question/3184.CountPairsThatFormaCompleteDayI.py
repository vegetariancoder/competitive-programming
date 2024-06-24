hours = [12, 12, 30, 24, 24]

count = 0

for i in range(len(hours)):
    for j in range(i + 1, len(hours)):
        if i < j and (hours[i] + hours[j]) % 24 == 0:
            count += 1

print(count)
