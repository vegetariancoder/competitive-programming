inp = [("Adventure", 5), ("Adventure", 2), ("History", 3)]

category_max = {}
for category, value in inp:
    if category not in category_max or value > category_max[category]:
        category_max[category] = value

result = 0
for key, value in sorted(category_max.items(), key=lambda x: x[1], reverse=True)[:3]:
    result += value

print(result)




