from collections import defaultdict
from sortedcontainers import SortedList


class Leaderboard:
    def __init__(self):
        self.d = defaultdict(int)
        self.rank = SortedList()
        self.scoreValues = []

    def addScore(self, playerId: int, score: int) -> SortedList:
        score_id = [playerId, score]
        self.rank.add(score_id)
        return self.rank

    def top(self, K: int) -> int:
        for values in self.rank[:K]:
            self.scoreValues.append(values[1])
        return sum(self.scoreValues)

    def reset(self, playerId: int) -> None:
        return self.rank.pop(playerId)


leaderboard = Leaderboard()
print(leaderboard.addScore(1, 73))
print(leaderboard.addScore(2,56))
print(leaderboard.addScore(3,39))
print(leaderboard.addScore(4,51))
print(leaderboard.addScore(5,4))
print(leaderboard.top(1))
print(leaderboard.reset(0))
print(leaderboard.reset(1))
# print(leaderboard.addScore(2, 51))
# print(leaderboard.top(3))