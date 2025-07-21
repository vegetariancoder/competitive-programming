code = ["SAVE20","","PHARMA5","SAVE@20"]
businessLine = ["restaurant","grocery","pharmacy","restaurant"]
isActive = [True,True,True,True]


import re

def is_valid_string(s):
    return bool(re.match(r'^[\w]+$', s))

result = []

all_zips = zip(code,businessLine,isActive)

for i in all_zips:
    if i[0] is not None and is_valid_string(i[0]) and i[2] and i[1] in ["restaurant","grocery","pharmacy","restaurant"]:
        result.append((i[0],i[1]))

result = [x[0] for x in sorted(result,key=lambda x:x[1])]
print(result)