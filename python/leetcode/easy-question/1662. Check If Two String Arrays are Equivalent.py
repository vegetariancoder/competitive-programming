from typing import List


def arrayStringsAreEqual(word1: List[str], word2: List[str]) -> bool:
    return "".join([x for x in word1]) == "".join([x for x in word2])


print("1720. Decode XORed Array".replace(" ","%20"))
