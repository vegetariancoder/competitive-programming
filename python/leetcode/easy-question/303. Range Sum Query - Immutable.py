class NumArray(object):

    def __init__(self, nums):
        """
        :type nums: List[int]
        """

        self.nums = nums

    def sumRange(self, left, right):
        """
        :type left: int
        :type right: int
        :rtype: int
        """
        answer = sum([self.nums[x] for x in range(left, right+1)])
        return answer


numArray = NumArray([-2, 0, 3, -5, 2, -1])
print(numArray.sumRange(0, 2))


