timeSeries = [1,4]
duration = 2

list_value = []
for number in range(len(timeSeries)):
    for _ in range(timeSeries[number],timeSeries[number]+duration):
        list_value.append(_)

print(len(set(list_value)))
