n = 124
import itertools


list_n = [int(x) for x in str(n).strip("")]

combinations = list(itertools.combinations(list_n, 2))
print(combinations)
products = max([a * b for a, b in combinations])


print(products)