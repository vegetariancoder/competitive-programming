n = 10



n_bin = bin(n)[2:]
print(n_bin)
n_bin_reverse = n_bin[::-1]
print(n_bin_reverse)

if n_bin == n_bin_reverse:
    print(0)
else:
    print(sum([1 for x,y in zip(n_bin,n_bin_reverse) if x!=y]))




