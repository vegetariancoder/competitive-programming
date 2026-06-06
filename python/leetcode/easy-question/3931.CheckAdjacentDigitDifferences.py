s = "129"

s_split = list(s.strip())


for nums in range(len(s_split)-1):
    print(abs(int(s_split[nums]) - int(s_split[nums+1])))
    if abs(int(s_split[nums]) - int(s_split[nums+1]))>2:
        print(False)
    else:
        print(True)