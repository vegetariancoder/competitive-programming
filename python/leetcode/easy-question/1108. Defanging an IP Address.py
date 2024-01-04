def defangIPaddr(self, address):
    """
    :type address: str
    :rtype: str
    """
    self.address = address
    return self.address.replace(".", "[.]")


print("1108. Defanging an IP Address".replace(" ","%20"))