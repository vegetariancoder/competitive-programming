nums = [1,1,2,3]

result = []

pairs = [[nums[i],[nums[i+1]]]for i in range(0, len(nums),2)]
all_lists = sum([x[0]*x[1] for x in pairs],[])
print(all_lists)


print("3019. Number of Changing Keys".replace(" ","%20"))