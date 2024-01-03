def finalValueAfterOperations(self, operations):
    """
    :param self:
    :type operations: List[str]
    :rtype: int
    """
    self.operations = operations
    result = 0
    for operation in self.operations:
        if operation.startswith("X+") or operation.startswith("++"):
            result += 1
        elif operation.startswith("X-") or operation.startswith("--"):
            result -= 1
    return result


print("2011. Final Value of Variable After Performing Operations".replace(" ","%20"))