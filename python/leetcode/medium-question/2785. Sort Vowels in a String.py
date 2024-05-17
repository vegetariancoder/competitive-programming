s = "lEetcOde"

all_vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'}
vowels = sorted([c for c in s if c in all_vowels])

pos,res = 0,list(s)
for i,c in enumerate(res):
    if c in vowels:
        res[i] = vowels[pos]
        pos += 1

print("".join(res))
