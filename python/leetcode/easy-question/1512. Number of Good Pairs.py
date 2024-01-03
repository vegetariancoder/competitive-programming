def numIdenticalPairs(self, nums):
    """
    :type nums: List[int]
    :rtype: int
    """
    self.nums = nums
    count = 0
    for x in range(len(self.nums)):
        for y in range(len(self.nums)):
            if self.nums[x] == self.nums[y] and x < y:
                count += 1
    return count