n = 25

str_n = int(''.join(reversed(str(n))))
print(str_n)
answer = abs(n - str_n)
print(answer)