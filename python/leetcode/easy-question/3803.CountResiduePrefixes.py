s = "bbbb"
count = 0

for i in range(1, len(s) + 1):
    prefix = s[:i]

    if len(set(prefix)) == len(prefix) % 3:
        count += 1

print(count)