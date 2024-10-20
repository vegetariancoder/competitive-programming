from itertools import permutations


arr = [91,4,64,78];pieces = [[78],[4,64],[91]]

if len(pieces) ==1 and pieces[0]!=arr:
    print(False)
else:
    all_permutations = permutations(pieces)
    result = [list(p) for p in all_permutations]
    flattened_results = [[item for sublist in perm for item in sublist] for perm in result]
    if arr in flattened_results:
        print(True)