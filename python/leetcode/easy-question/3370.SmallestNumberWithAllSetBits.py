n = 514

numbers  = [
    (bin(x).replace("0b", ""), x)
    for x in range(n, 1001)
    if set(bin(x).replace("0b", "")) == {'1'}  # Check if all characters are '1'
][0][1]
print(numbers)