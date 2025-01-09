from collections import Counter

nums = [1,1,2,2,3,4]


for number,frequency in Counter(nums).items():
    if frequency > 2:
        print(False)
else:
    print(True)