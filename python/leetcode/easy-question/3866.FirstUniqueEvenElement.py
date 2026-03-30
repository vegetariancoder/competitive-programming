nums = [4,4]

even_nums = {x:nums.count(x) for x in nums if x%2==0 and nums.count(x)==1}
if len(even_nums)==0:
    print(-1)
print(list(even_nums.keys())[0])
