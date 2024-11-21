height = [1,2,3,4,5]
threshold = 2
result = []


for h in range(len(height)):
    # print(height[h-1],height[h],h)
    if h!=0 and height[h-1] > threshold:
        result.append(h)

print(result)