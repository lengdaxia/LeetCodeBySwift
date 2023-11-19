
class Solution {
    static func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = Array(repeating: Array(repeating: 0, count: 2), count: 2)

        for i in 0..<n {
            // 给dp状态表初始化赋值
            if i == 0 {
                dp[0][0] = 0
                dp[0][1] = -prices[0]
                continue
            }

            dp[i][0] = max(dp[i-1][0], y: dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][i], y: -prices[i])
        }
        return dp[n-1][0]
    }
}