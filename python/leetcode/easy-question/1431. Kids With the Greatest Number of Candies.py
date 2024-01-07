def kidsWithCandies(self, candies, extraCandies):
    """
    :type candies: List[int]
    :type extraCandies: int
    :rtype: List[bool]
    """
    self.candies = candies
    self.extraCandies = extraCandies
    max_candy_count = max(self.candies)
    return [(x + self.extraCandies) >= max_candy_count for x in candies]


print("1365. How Many Numbers Are Smaller Than the Current Number".replace(" ","%20"))