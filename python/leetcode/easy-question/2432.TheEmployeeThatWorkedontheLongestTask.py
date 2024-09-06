n = 2
logs =[[36,3],[1,5],[12,8],[25,9],[53,11],[29,12],[52,14]]

times = [0]
max_hours = []
result = []

for x in logs:
    times.append(x[1])


for values in range(len(times)-1):
    max_hours.append(times[values+1] - times[values])

indices_max_hours = [index for index, value in enumerate(max_hours) if value == max(max_hours)]

answer = [x for x in logs if logs.index(x) in indices_max_hours]

for x in answer:
    result.append(x[0])

print(min(result))


###

max_hours = []
max_diff = 0
min_result = float('inf')

# Calculate differences and track the maximum difference
for i in range(len(logs)):
    diff = logs[i][1] - (logs[i - 1][1] if i > 0 else 0)
    max_hours.append(diff)

    if diff > max_diff:
        max_diff = diff
        min_result = logs[i][0]
    elif diff == max_diff:
        min_result = min(min_result, logs[i][0])
