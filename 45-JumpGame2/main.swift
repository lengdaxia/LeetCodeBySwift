class Solution {

    func jumpgame(_ nums:[Int]) -> Int {
        let n = nums.count - 1

        var jumps = 0
        var farthest = 0 
        var end = 0

        for i in 0..<n {
            farthest = max(farthest, i + nums[i])
            //jump1: i = 0, jumps += 1, end = farthest
            //jump2: when i reach to first end(which is first round of farthest index), 
            //jumps += 1, and update end to newest further point
            //when i = n-1, 
            if end == i {
                jumps += 1
                end = farthest
            }
        }
        return jumps
    }
}