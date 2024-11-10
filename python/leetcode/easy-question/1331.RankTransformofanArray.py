arr = [37,12,28,9,100,56,80,5,12]
set_arr = list(set(arr))
result = [sorted(set_arr).index(x)+1 for x in arr]
print(result)