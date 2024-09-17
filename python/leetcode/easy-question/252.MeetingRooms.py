intervals = [[7,10],[2,4]]
start_time = [x[0] for x in intervals]
result = []

for times in intervals:
    for st in start_time:
       if times[0] < st < times[1]:
           result.append("yes")

if len(result) <= 0:
    print(True)
else:
    print(False)