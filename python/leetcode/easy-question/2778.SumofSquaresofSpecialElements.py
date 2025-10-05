nums = [2,7,1,19,18,3]



special_elements = sum([nums[x] * nums[x] for x in range(len(nums)) if len(nums)%(x+1)==0])
print(special_elements)
