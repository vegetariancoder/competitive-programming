n = 1

sorted_n = "".join(sorted(str(n)))
print(sorted_n)

powers_of_2 = ["".join(sorted(str(pow(2, val)))) for val in range(30)]
print(powers_of_2)

if sorted_n in powers_of_2:
    print(True)
