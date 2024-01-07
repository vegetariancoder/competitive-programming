class Solution(object):
    def interpret(self, command):
        """
        :type command: str
        :rtype: str
        """
        return command.replace("()", "o").replace("(al)", "al")

print("1678. Goal Parser Interpretation".replace(" ","%20"))