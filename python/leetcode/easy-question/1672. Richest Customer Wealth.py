def maximumWealth(self, accounts):
    """
    :type accounts: List[List[int]]
    :rtype: int
    """
    self.accounts = accounts
    return max([sum(x) for x in self.accounts])