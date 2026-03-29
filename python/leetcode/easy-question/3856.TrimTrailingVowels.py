s = "aeiou"
s_split = list(s.strip())

while len(s_split) > 0 and s_split[-1] in ['a', 'e', 'i', 'o', 'u']:
    s_split.pop()

print("".join(s_split))