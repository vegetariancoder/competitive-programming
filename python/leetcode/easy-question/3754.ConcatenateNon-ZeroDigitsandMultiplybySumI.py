n = 10203004

split_n = int("".join([x for x in list(str(n).strip('')) if x != '0'])) * sum([int(x) for x in list(str(n).strip('')) if x != '0'])
print(split_n)

