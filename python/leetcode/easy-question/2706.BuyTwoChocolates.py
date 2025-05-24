prices = [1,2,2]
money = 3

sortedPrice = sorted(prices)
print(sortedPrice)

if sum(sortedPrice[0:2]) <= money:
    print(sum(sortedPrice[0:2])-money)
else:
    print(money)