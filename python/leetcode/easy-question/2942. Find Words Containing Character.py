def findWordsContaining(self, words, x):
    """
    :param self:
    :type words: List[str]
    :type x: str
    :rtype: List[int]
    """
    self.x = x
    self.words = words
    return [i for i in range(len(self.words)) if self.x in self.words[i]]

print("2942. Find Words Containing Character".replace(" ","%20"))