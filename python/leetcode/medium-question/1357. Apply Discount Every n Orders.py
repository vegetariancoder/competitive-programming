class Cashier(object):

    def __init__(self, n, discount, products, prices):
        """
        :type n: int
        :type discount: int
        :type products: List[int]
        :type prices: List[int]
        """
        self.n = n
        self.discount = discount
        self.products = products
        self.prices = prices
        self.cnt = 0

    def getBill(self, product, amount):
        """
        :type product: List[int]
        :type amount: List[int]
        :rtype: float
        """
        self.products = product
        self.quantity = amount
        self.new_amount = []
        self.cnt += 1
        max_product_id = max(product) if product else 0
        if max_product_id > len(self.prices):
            raise IndexError("Product ID out of range in prices list")
        for product_id in self.products:
            self.new_amount.append(self.prices[product_id - 1])
        total_value = [x * y for x, y in zip(self.new_amount, self.quantity)]
        total_sum = sum(total_value)
        if self.cnt % self.n == 0:
            return total_sum * ((100 - self.discount) / 100)
        else:
            return total_sum

cashier = Cashier(n=3, discount=50, products=[1, 2, 3, 4, 5, 6, 7], prices=[100, 200, 300, 400, 300, 200, 100])
print(cashier.getBill([1, 2], [1, 2]))
print(cashier.getBill([3, 7], [10, 10]))
print(cashier.getBill([1, 2, 3, 4, 5, 6, 7], [1, 1, 1, 1, 1, 1, 1]))


print("1357. Apply Discount Every n Orders".replace(" ","%20"))
