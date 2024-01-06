def numJewelsInStones(self, jewels, stones):
    """
    :type jewels: str
    :type stones: str
    :rtype: int
    """
    count = 0
    self.jewels = jewels
    self.stones = stones

    jewels = list(self.jewels.strip())
    stones = list(self.stones.strip())
    for x in stones:
        for y in jewels:
            if x == y:
                count += 1
    return count