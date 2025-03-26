nums = [0,0]
k = 1

if len(nums) < k:
    print(0)

sub_array = []
missing = {}
cnt = 0
for i in range(len(nums)-k+1):
    sub_array.append(nums[i:i+k])

for number in nums:
    cnt = 0
    for sub_number in sub_array:
        if number in sub_number:
            cnt += 1
            missing[number] = cnt

sub_vals = [key for key,value in missing.items() if value==1]
if len(sub_vals)>0:
    print(max(sub_vals))
print(-1)




