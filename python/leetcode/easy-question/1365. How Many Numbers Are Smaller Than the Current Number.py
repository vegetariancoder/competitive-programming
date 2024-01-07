def smallerNumbersThanCurrent(self, nums):
    """
    :type nums: List[int]
    :rtype: List[int]
    """
    self.nums = nums
    return [sorted(nums).index(x) for x in self.nums]