class SmallestInfiniteSet(object):

    def __init__(self):
        range_list = list(range(1,1001))
        self.set = set(range_list)

    def popSmallest(self):
        """
        :rtype: int
        """
        min_element = min(self.set)
        self.set.remove(min_element)
        return min_element

    def addBack(self, num):
        """
        :type num: int
        :rtype: None
        """
        if num not in self.set:
            self.set.add(num)

# Your SmallestInfiniteSet object will be instantiated and called as such:
# obj = SmallestInfiniteSet()
# param_1 = obj.popSmallest()
# obj.addBack(num)