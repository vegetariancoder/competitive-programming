events = events = events = ["W","W","W","W","W","W","W","W","W","W","6"]

score = 0
counter = 0
answer = []

for x in events:
    if x == "W":
        counter += 1
        if counter >=10:
            break
    else:
        if len(x)==2:
            score+=1
        else:
            score+=int(x)

answer.append(score)
answer.append(counter)
print(answer)