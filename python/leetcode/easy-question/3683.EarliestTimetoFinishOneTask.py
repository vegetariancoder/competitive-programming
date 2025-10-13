tasks = [[1,6],[2,3]]
task_time = []

task_time = min([sum(x) for x in tasks])

for i in tasks:
    task_time.append(sum(i))

print(min(task_time))