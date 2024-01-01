from collections import Counter

grid = [[1,3],[2,2]]




grid = sum(grid,[])

# missing number

all_value_grid = [x for x in range(1,len(grid)+1)]
print(all_value_grid)

answer = list(set(all_value_grid)-set(grid))


# repeated value
for key,value in Counter(grid).items():
    if value > 1:
        answer.insert(0,key)


print(answer)


