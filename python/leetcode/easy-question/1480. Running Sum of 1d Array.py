def runningSum(self, nums):
    """
    :type nums: List[int]
    :rtype: List[int]
    """
    self.nums = nums
    return [sum(self.nums[:i + 1]) for i in range(len(self.nums))]