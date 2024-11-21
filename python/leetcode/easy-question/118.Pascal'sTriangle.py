numRows = 1
import math

answer = []

for nums in range(numRows):
    numbers = [int(x) for x in str(int(math.pow(11,nums)))]
    answer.append(numbers)
print(answer)