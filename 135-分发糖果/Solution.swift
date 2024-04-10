/*
n 个孩子站成一排。给你一个整数数组 ratings 表示每个孩子的评分。

你需要按照以下要求，给这些孩子分发糖果：

每个孩子至少分配到 1 个糖果。
相邻两个孩子评分更高的孩子会获得更多的糖果。
请你给每个孩子分发糖果，计算并返回需要准备的 最少糖果数目 。

 
示例 1：

输入：ratings = [1,0,2]
输出：5
解释：你可以分别给第一个、第二个、第三个孩子分发 2、1、2 颗糖果。
示例 2：

输入：ratings = [1,2,2]
输出：4
解释：你可以分别给第一个、第二个、第三个孩子分发 1、2、1 颗糖果。
     第三个孩子只得到 1 颗糖果，这满足题面中的两个条件。
 

提示：

n == ratings.length
1 <= n <= 2 * 104
0 <= ratings[i] <= 2 * 104
*/

class Solution {

    static func candy(_ ratings:[Int]) -> Int {

        let n = ratings.count
        var candies:[Int] = [Int](repeating: 1, count: n)

        // 从左往右，评分高的多一个糖果
        for i in 1..<n {
            if ratings[i] > ratings[i-1] {
                candies[i] = candies[i-1] + 1
            }
        }

        // 从右往左，评分高的
        for i in (0..<n-1).reversed() {
            if ratings[i] > ratings[i+1] {
                candies[i] = max(candies[i], candies[i+1]+1)
            }
        }

        let sum = candies.reduce(0, +)
        return sum
    }
}

// let ratings = [1,0,2]
// let ratings = [1,2,2]
let ratings = [1,2,2,3,4,5,3,2,0,1,0]

let ret = Solution.candy(ratings)
print(ret)