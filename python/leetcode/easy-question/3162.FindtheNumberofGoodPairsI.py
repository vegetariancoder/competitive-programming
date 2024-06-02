nums1 = [1,3,4]
nums2 = [1,3,4]
k = 1
cnt = 0

for num in range(len(nums1)):
    for num2 in range(len(nums2)):
        if nums1[num]%(nums2[num2]*k) == 0:
            cnt += 1

print(cnt)