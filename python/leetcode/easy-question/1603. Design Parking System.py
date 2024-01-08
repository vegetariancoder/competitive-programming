class ParkingSystem(object):

    def __init__(self, big, medium, small):
        """
        :type big: int
        :type medium: int
        :type small: int
        """
        self.big = big
        self.medium = medium
        self.small = small

    def addCar(self, carType):
        """
        :type carType: int
        :rtype: bool
        """
        if carType == 1 and self.big >=1:
            self.big -=1
            return True
        elif carType == 2 and self.medium >=1:
            self.medium -=1
            return True
        elif carType == 3 and self.small >=1:
            self.small -=1
            return True
        return False

print("1603. Design Parking System".replace(" ","%20"))