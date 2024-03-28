class Solution {

    static func removeElement(_ nums:inout[Int], _ val: Int) -> Int{
        var slow = 0, fast = 0
        while fast < nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
    }
}

var elements = [3,2,2,3]
let val = 3 

let ret = Solution.removeElement(&elements, val)
print(elements)
print(ret)