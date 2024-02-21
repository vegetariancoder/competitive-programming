nums = [1,2,3,4,0]; index = [0,1,2,3,0]

answer = []
for nums_elem,index_val in zip(nums,index):
    answer.insert(index_val,nums_elem)


print("2974. Minimum Number Game".replace(" ","%20"))