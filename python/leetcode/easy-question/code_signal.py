Input = ["123432345", "ascdfvcdfg", "1aqs324edr"]
new_list = []


def is_one_bit_string(s):
    return all(c in {'0', '1'} for c in s)


if all(is_one_bit_string(s) for s in Input):

    # Check if all values are the same
    if all(x == Input[0] for x in Input):
        for one_bit in Input:
            new_list.append(int(one_bit, 2))

    # check if not working

    elif all(is_one_bit_string(s) for s in Input) == False:
        print("Invalid")

    # check if increasing
    for one_bit in Input:
        new_list.append(int(one_bit, 2))
    if all(new_list[i] < new_list[i + 1] for i in range(len(new_list) - 1)):
        new_list = [str(x) for x in new_list]
        new_list.append("Improving")

    # check if decreasing
    elif all(new_list[i] > new_list[i + 1] for i in range(len(new_list) - 1)):
        new_list = [str(x) for x in new_list]
        new_list.append("Degrading")

    elif not (all(new_list[i] < new_list[i + 1] for i in range(len(new_list) - 1)) and all(
            new_list[i] > new_list[i + 1] for i in range(len(new_list) - 1))):
        new_list = [str(x) for x in new_list]
        new_list.append("Unstable")
else:
    new_list.append("Invalid")

print(new_list)
