class Solution {

    func canJump(_ nums:[Int]) -> Bool {
        let n = nums.count - 1
        if n <= 0 {
            return true 
        }

        // farthest position can jump
        var farthest = 0 
        for i in 0..<n {
            // update farthest 
            farthest = max(farthest, i + nums[i])
            // return false if nums[i] == 0 or negative
            if farthest <= i {
                return false
            }
        }
        return farthest >= n 
    }
}