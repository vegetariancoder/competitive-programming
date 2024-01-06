def numberOfEmployeesWhoMetTarget(self, hours, target):
    """
    :type hours: List[int]
    :type target: int
    :rtype: int
    """
    self.hours = hours
    self.target = target
    return len([x for x in hours if x >= target])