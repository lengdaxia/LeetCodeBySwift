
class Solution {

    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        // edge case
        if nums.count == 0 { return 0 }
        // hold and modify nums[0..slow] list, by slow and fast pointer
        var slow = 0, fast = 0
        // count the duplicate count while iterate the list
        var count = 0

        while fast < nums.count {
            // met new element with diff value, add new element to nums[0..slow] list, increment slow-index
            if nums[fast] != nums[slow] { 
                slow += 1
                nums[slow] = nums[fast]
                //when met new element with diff value but count < 2, then add to slow list,and increment slow-index
                //extral condition: slow < fast && count < 2,
            } else if slow < fast && count < 2 {
                slow += 1
                nums[slow] = nums[fast]
            }

            // fast and count increment
            fast += 1
            count += 1

            // count reset condition
            // must add fast < nums.count condition to prevent outOfBountryException
            if fast < nums.count && nums[fast] != nums[fast - 1] {
                count = 0
            }
        }

        return slow + 1
    }

    // https://leetcode.cn/problems/remove-duplicates-from-sorted-array-ii/solutions/702644/shan-chu-pai-xu-shu-zu-zhong-de-zhong-fu-yec2
    static func removeDuplicates2(_ nums: inout [Int]) -> Int {
        let n = nums.count
        if n <= 2 {
            return n
        }
        var slow = 2, fast = 2;
        while fast < n {
            if nums[slow-2] != nums[fast] {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow;
    }
}

var nums = [0,0,1,1,1,1,2,3,3]
let ret = Solution.removeDuplicates2(&nums)
// let ret = Solution.removeDuplicates(&nums)

print(ret)
