def mostWordsFound(self, sentences):
    """
    :type sentences: List[str]
    :rtype: int
    """
    self.sentences = sentences
    return max([len(x.split(" ")) for x in self.sentences])

print("2574. Left and Right Sum Differences".replace(" ","%20"))