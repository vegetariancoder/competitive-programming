year = 2000
month = 2
days = 0
if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0 and year % 100 == 0):
    if month == 2:
        days = 29
    elif month in [1,3,5,7,8,12]:
        days = 31
elif not (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0 and year % 100 == 0) and month == 2:
    days = 28
else:
    days = 30

print(days)

