s = "abcde"
t = "edbac"
result = 0

list_s = list(s.strip())
list_t = list(t.strip())

for s_element in list_s:
    if s_element in list_t:
        result += abs(list_s.index(s_element) - list_t.index(s_element))

print(result)
print("3146. Permutation Difference between Two Strings".replace(" ","%20"))
