class Solution:
    def pivotInteger(self, n: int) -> int:
        if n == 1:
            return 1
        else:
            sum_values = sum([x for x in range(0, n + 1)])
            print(sum_values)

            temp = 0

            for numbers in range(n):
                sum_values -= numbers
                if temp == sum_values:
                    return numbers
                temp += numbers
            return -1
