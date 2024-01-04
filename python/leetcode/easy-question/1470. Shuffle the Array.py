def shuffle(self, nums: List[int], n: int) -> List[int]:
    self.nums = nums
    nums_1 = self.nums[:n]
    nums_2 = self.nums[n:]
    answer = [x for z in zip(nums_1, nums_2) for x in z]
    return answer


print("1470. Shuffle the Array".replace(" ","%20"))