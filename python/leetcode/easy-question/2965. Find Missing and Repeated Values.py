from collections import Counter


def findMissingAndRepeatedValues(self, grid):

    self.grid = sum(grid,[])

    # missing number

    all_value_grid = [x for x in range(1,len(grid)+1)]
    answer = list(set(all_value_grid)-set(grid))

    # repeated value
    for key,value in Counter(grid).items():
        if value > 1:
            answer.insert(0,key)

    return answer


