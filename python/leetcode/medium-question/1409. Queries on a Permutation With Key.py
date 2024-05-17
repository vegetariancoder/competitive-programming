queries = [7,5,5,8,3]
m = 8
index_vals = []

P = [x + 1 for x in range(m)]
print(P)

for element in queries:
    if element in P:
        index_vals.append(P.index(element))
        old_index = P.index(element)
        P.insert(0, P.pop(old_index))

print(index_vals)

list_vals = ["1409. Queries on a Permutation With Key","2336. Smallest Number in Infinite Set","2375. Construct Smallest Number From DI String","2785. Sort Vowels in a String","2423. Remove Letter To Equalize Frequency"]

for x in list_vals:
    print(x," : ",x.replace(" ","%20"))
