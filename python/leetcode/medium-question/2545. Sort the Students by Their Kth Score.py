score = [[10, 6, 9, 1], [7, 5, 11, 2], [4, 8, 3, 15]]
k = 2

score.sort(key=lambda x: x[k], reverse=True)
print(score)

print("2545. Sort the Students by Their Kth Score".replace(" ","%20"))
