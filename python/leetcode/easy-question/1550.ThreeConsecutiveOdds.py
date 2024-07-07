def threeConsecutiveOdds(arr):
    cnt = 0
    for x in arr:
        if x % 2 != 0:
            cnt += 1
            if cnt == 3:
                return True
        else:
            cnt = 0
    return False


arr = [1, 2, 34, 3, 4, 5, 7, 23, 12]
print(threeConsecutiveOdds(arr))
