nums = [1, 10, 11]

answer = []
numbers = [sum(int(num) for num in str(x)) for x in nums]
for number, index in enumerate(numbers):
    if number == index:
        answer.append(number)
print(min(answer))
