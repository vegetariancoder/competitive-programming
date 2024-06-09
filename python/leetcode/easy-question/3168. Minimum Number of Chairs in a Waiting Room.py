s = "ELEELEELLL"

chairs_needed = 0
people_in_room = 0
max_people = []

list_s = list(s.strip(""))

print(list_s)


for person in list_s:
    if person == 'E':
        chairs_needed += 1
        people_in_room += 1
        max_people.append(people_in_room)
    elif person == 'L':
        people_in_room -= 1
        max_people.append(people_in_room)

print(people_in_room)
print(chairs_needed)
print(max_people)
print(max(max_people))
