class MyHashSet(object):

    def __init__(self):
        self.hashSet = []

    def add(self, key):
        """
        :type key: int
        :rtype: None
        """
        if key not in self.hashSet:
            self.hashSet.append(key)


    def remove(self, key):
        """
        :type key: int
        :rtype: None
        """
        if key in self.hashSet:
            self.hashSet.remove(key)

    def contains(self, key):
        """
        :type key: int
        :rtype: bool
        """
        return key in self.hashSet

# Your MyHashSet object will be instantiated and called as such:
obj = MyHashSet()
obj.add(1)
obj.add(2)
print(obj.contains(1))
print(obj.contains(3))
obj.add(2)
print(obj.contains(2))
obj.remove(2)
print(obj.contains(2))
print("705. Design HashSet".replace(" ","%20"))

