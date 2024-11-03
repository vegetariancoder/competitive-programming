date = "2080-02-29"

values_date = [int(bin(int(x))[2:]) for x in date.split("-")]
answer = "-".join([str(x) for x in values_date])
print(answer)
