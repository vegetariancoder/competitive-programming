nums1 = [2,3,2]
nums2 = [1,2]

nums_1_cnt = []
nums_2_cnt = []
answer = []

for x in nums1:
    if x in nums2:
        nums_1_cnt.append(x)

for x in nums2:
    if x in nums1:
        nums_2_cnt.append(x)

answer.append(len(nums_1_cnt))
answer.append(len(nums_2_cnt))

print(answer)