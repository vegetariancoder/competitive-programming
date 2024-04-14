x = 18


sum_x = sum([int(x) for x in str(x).strip()])
if x%sum_x == 0:
    print(sum_x)
else:
    print(-1)

print("3099. Harshad Number".replace(" ","%20"))