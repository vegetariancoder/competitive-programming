import itertools


def countPairs(self, nums, target):
    """
    :type nums: List[int]
    :type target: int
    :rtype: int
    """
    self.nums = nums
    self.target = target
    return len([list(x) for x in itertools.combinations(self.nums, 2) if sum(list(x)) < self.target])