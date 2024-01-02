def buildArray(self, nums):
    """
    :type nums: List[int]
    :rtype: List[int]
    """
    self.nums = nums
    return [self.nums[self.nums[x]] for x in range(len(self.nums))]