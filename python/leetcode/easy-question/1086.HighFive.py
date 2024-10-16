from collections import defaultdict

items = [[1,100],[7,100],[1,100],[7,100],[1,100],[7,100],[1,100],[7,100],[1,100],[7,100]]
d = defaultdict(list)

for i,x in items:
    d[i].append(x)

for key in d:
    d[key] = sum(sorted(d[key],reverse=True)[:5])

result = [[key,int(value/5)]for key,value in d.items()]
print(result)